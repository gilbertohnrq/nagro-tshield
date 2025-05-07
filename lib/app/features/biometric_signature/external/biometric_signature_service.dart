import 'package:dio/dio.dart';
import 'package:finan/app/features/biometric_signature/external/exceptions/biometric_signature_exceptions.dart';
import 'package:finan/app/features/biometric_signature/external/i_biometric_signature_service.dart';
import 'package:finan/app/features/biometric_signature/infra/models/get_proposal_available_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/ocr_document_request.dart';
import 'package:finan/app/features/biometric_signature/infra/models/ocr_document_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/refuse_request.dart';
import 'package:finan/app/features/biometric_signature/infra/models/refuse_response.dart';
import 'package:finan/app/features/biometric_signature/infra/models/sign_contract_request.dart';

class BiometricSignatureService extends IBiometricSignatureService {
  BiometricSignatureService();

  Map<int, BiometricExceptionsException> exceptions = {
    404: NotFoundException(),
    500: InternalServerException(),
    403: ForbiddenException(),
    503: ServiceUnavailableException()
  };

  @override
  Future<GetProposalAvailableResponse> getProposeAvailable() async {
    try {
      return GetProposalAvailableResponse.mocked();
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    } catch (e) {
      throw InvalidDataException();
    }
  }

  @override
  Future<bool> signContract(SignContractRequest signContractRequest) async {
    try {
      return true;
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    } catch (e) {
      throw InvalidDataException();
    }
  }

  @override
  Future<OcrDocumentResponse> ocrDocument(
      OcrDocumentRequest ocrDocumentRequest) async {
    try {
      return OcrDocumentResponse.mocked();
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    } catch (e) {
      throw InvalidDataException();
    }
  }

  @override
  Future<RefuseResponse> refuse(RefuseRequest refuseRequest) async {
    try {
      return RefuseResponse.mocked();
    } on DioException catch (dioException) {
      if (exceptions.containsKey(dioException.response?.statusCode)) {
        throw exceptions[dioException.response?.statusCode]!;
      } else {
        throw NotFoundException();
      }
    } catch (e) {
      throw InvalidDataException();
    }
  }
}
