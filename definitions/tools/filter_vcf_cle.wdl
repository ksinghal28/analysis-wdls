version 1.0

task filterVcfCle {
  input {
    File vcf
    Boolean filter
  }

  runtime {
    docker: "mgibio/cle:v1.3.1"
    memory: "4GB"
  }

  command <<<
    /usr/bin/perl /usr/bin/docm_and_coding_indel_selection.pl ~{vcf} $PWD filter ~{filter}
  >>>

  output {
    File cle_filtered_vcf = "annotated_filtered.vcf"
  }
}
