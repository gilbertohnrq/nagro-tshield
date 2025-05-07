// coverage:ignore-file
//coverage:ignore-file

import 'package:finan/app/features/biometric_signature/infra/models/get_proposal_available_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/ocr_document_request.dart';
import 'package:finan/app/features/biometric_signature/infra/models/ocr_document_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/refuse_request.dart';
import 'package:finan/app/features/biometric_signature/infra/models/refuse_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/sign_contract_request.dart';

abstract class IBiometricSignatureService {
  Future<GetProposalAvailableResponse> getProposeAvailable();
  Future<bool> signContract(SignContractRequest signContractRequest);
  Future<RefuseResponse> refuse(RefuseRequest refuseRequest);
  Future<OcrDocumentResponse> ocrDocument(OcrDocumentRequest ocrDocumentRequest);
}
