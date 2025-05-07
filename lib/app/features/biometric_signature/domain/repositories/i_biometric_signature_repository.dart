// coverage:ignore-file
//coverage:ignore-file

import 'package:finan/app/features/biometric_signature/domain/failures/biometric_signature_failures.dart';
import 'package:finan/app/features/biometric_signature/infra/models/get_proposal_available_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/ocr_document_request.dart';
import 'package:finan/app/features/biometric_signature/infra/models/ocr_document_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/refuse_request.dart';
import 'package:finan/app/features/biometric_signature/infra/models/refuse_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/sign_contract_request.dart';
import 'package:result_dart/result_dart.dart';

abstract class IBiometricSignatureRepository {
  AsyncResult<GetProposalAvailableResponse, BiometricSignatureFailure>
      getProposeAvailable();
  AsyncResult<bool, BiometricSignatureFailure> signContract(
      SignContractRequest signContractRequest);
  AsyncResult<RefuseResponse, BiometricSignatureFailure> refuse(
      RefuseRequest refuseRequest);
  AsyncResult<OcrDocumentResponse, BiometricSignatureFailure> ocrDocument(
      OcrDocumentRequest ocrDocumentRequest);
}
