// coverage:ignore-file
import 'dart:io';

import 'package:finan/app/features/biometric_signature/infra/models/get_proposal_available_response.dart';

class BiometricSignatureSendPhotoPageArguments {
  GetProposalAvailableResponse proposalResponse;
  File? attachPDF;
  String? selfie;
  String? encrypted;
  bool? fromPreApproved;

  BiometricSignatureSendPhotoPageArguments(
    this.proposalResponse,
    this.attachPDF,
    this.selfie,
    this.encrypted,
    this.fromPreApproved,
  );

  factory BiometricSignatureSendPhotoPageArguments.mocked({
    GetProposalAvailableResponse? proposalResponse,
    File? attachPDF,
    String? selfie,
    String? encrypted,
    bool? fromPreApproved,
  }) {
    return BiometricSignatureSendPhotoPageArguments(
      proposalResponse ?? GetProposalAvailableResponse.mocked(),
      attachPDF ?? File('path/to/pdf'),
      selfie ?? 'path/to/selfie',
      encrypted ?? 'encrypted',
      fromPreApproved ?? true,
    );
  }
}
