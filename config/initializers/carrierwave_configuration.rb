 CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: "AKIAIXBFPW64VUEHLDFQ",
      aws_secret_access_key: "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"
  }
  config.fog_directory = "eduleaf-development"
end