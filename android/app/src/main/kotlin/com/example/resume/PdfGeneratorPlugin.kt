package com.example.pdfgenerator

import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.File
import java.io.IOException

class PdfGeneratorPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "pdf_generator")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    @RequiresApi(Build.VERSION_CODES.O)
    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "generatePdf") {
            val latexCode = call.argument<String>("latexCode") ?: ""
            val outputFilePath = call.argument<String>("outputFilePath") ?: ""

            if (latexCode.isEmpty() || outputFilePath.isEmpty()) {
                result.error("INVALID_ARGS", "Latex code or output file path is missing", null)
                return
            }

            generatePdfFromLatex(latexCode, outputFilePath, result)
        } else {
            result.notImplemented()
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun generatePdfFromLatex(latexCode: String, outputFilePath: String, result: Result) {
        try {
            // 1. Create temporary LaTeX file
            val tempDir = File.createTempFile("latex", "").parentFile
            val latexFile = File(tempDir, "temp.tex")
            latexFile.writeText(latexCode)

            // 2. Generate PDF using pdflatex command
            val processBuilder = ProcessBuilder(
                "pdflatex",
                "-output-directory", tempDir.absolutePath,
                latexFile.absolutePath
            )
            val process = processBuilder.start()
            process.waitFor()

            // 3. Check for errors
            if (process.exitValue() != 0) {
                val errorOutput = process.errorStream.bufferedReader().readText()
                result.error("PDF_GENERATION_FAILED", "Pdflatex execution failed: $errorOutput", null)
                return
            }

            // 4. Move generated PDF to the desired output file path
            val generatedPdf = File(tempDir, "temp.pdf")
            val outputFile = File(outputFilePath)
            generatedPdf.copyTo(outputFile, overwrite = true)

            result.success("PDF generated successfully at $outputFilePath")
        } catch (e: IOException) {
            result.error("IO_EXCEPTION", "An I/O error occurred: ${e.message}", null)
        } catch (e: Exception) {
            result.error("GENERAL_EXCEPTION", "An error occurred: ${e.message}", null)
        }
    }
}
