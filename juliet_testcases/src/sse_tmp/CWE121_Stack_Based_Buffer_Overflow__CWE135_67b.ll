; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType = type { i8* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_67b_badSink(i8* %myStruct.coerce) #0 !dbg !17 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0, !dbg !29
  %0 = load i8*, i8** %structFirst, align 8, !dbg !29
  store i8* %0, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !30, metadata !DIExpression()), !dbg !34
  %1 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i64 @strlen(i8* %1) #5, !dbg !36
  store i64 %call, i64* %dataLen, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !37, metadata !DIExpression()), !dbg !38
  %2 = load i64, i64* %dataLen, align 8, !dbg !39
  %add = add i64 %2, 1, !dbg !39
  %mul = mul i64 %add, 4, !dbg !39
  %3 = alloca i8, i64 %mul, align 16, !dbg !39
  store i8* %3, i8** %dest, align 8, !dbg !38
  %4 = load i8*, i8** %dest, align 8, !dbg !40
  %5 = bitcast i8* %4 to i32*, !dbg !40
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %7 = bitcast i8* %6 to i32*, !dbg !41
  %call1 = call i32* @wcscpy(i32* %5, i32* %7) #6, !dbg !42
  %8 = load i8*, i8** %dest, align 8, !dbg !43
  call void @printLine(i8* %8), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !46 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i8** %data, metadata !49, metadata !DIExpression()), !dbg !50
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0, !dbg !51
  %0 = load i8*, i8** %structFirst, align 8, !dbg !51
  store i8* %0, i8** %data, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !54
  %1 = load i8*, i8** %data, align 8, !dbg !55
  %call = call i64 @strlen(i8* %1) #5, !dbg !56
  store i64 %call, i64* %dataLen, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !57, metadata !DIExpression()), !dbg !58
  %2 = load i64, i64* %dataLen, align 8, !dbg !59
  %add = add i64 %2, 1, !dbg !59
  %mul = mul i64 %add, 1, !dbg !59
  %3 = alloca i8, i64 %mul, align 16, !dbg !59
  store i8* %3, i8** %dest, align 8, !dbg !58
  %4 = load i8*, i8** %dest, align 8, !dbg !60
  %5 = load i8*, i8** %data, align 8, !dbg !61
  %call1 = call i8* @strcpy(i8* %4, i8* %5) #6, !dbg !62
  %6 = load i8*, i8** %dest, align 8, !dbg !63
  call void @printLine(i8* %6), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_67b_goodB2GSink(i8* %myStruct.coerce) #0 !dbg !66 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0, !dbg !71
  %0 = load i8*, i8** %structFirst, align 8, !dbg !71
  store i8* %0, i8** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !72, metadata !DIExpression()), !dbg !74
  %1 = load i8*, i8** %data, align 8, !dbg !75
  %2 = bitcast i8* %1 to i32*, !dbg !76
  %call = call i64 @wcslen(i32* %2) #5, !dbg !77
  store i64 %call, i64* %dataLen, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !78, metadata !DIExpression()), !dbg !79
  %3 = load i64, i64* %dataLen, align 8, !dbg !80
  %add = add i64 %3, 1, !dbg !80
  %mul = mul i64 %add, 4, !dbg !80
  %4 = alloca i8, i64 %mul, align 16, !dbg !80
  store i8* %4, i8** %dest, align 8, !dbg !79
  %5 = load i8*, i8** %dest, align 8, !dbg !81
  %6 = bitcast i8* %5 to i32*, !dbg !81
  %7 = load i8*, i8** %data, align 8, !dbg !82
  %8 = bitcast i8* %7 to i32*, !dbg !82
  %call1 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !83
  %9 = load i8*, i8** %dest, align 8, !dbg !84
  %10 = bitcast i8* %9 to i32*, !dbg !85
  call void @printWLine(i32* %10), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !9, line: 74, baseType: !10)
!9 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_67b_badSink", scope: !18, file: !18, line: 32, type: !19, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_67b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType", file: !18, line: 28, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE135_67_structType", file: !18, line: 25, size: 64, elements: !23)
!23 = !{!24}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !22, file: !18, line: 27, baseType: !6, size: 64)
!25 = !DILocalVariable(name: "myStruct", arg: 1, scope: !17, file: !18, line: 32, type: !21)
!26 = !DILocation(line: 32, column: 118, scope: !17)
!27 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 34, type: !6)
!28 = !DILocation(line: 34, column: 12, scope: !17)
!29 = !DILocation(line: 34, column: 28, scope: !17)
!30 = !DILocalVariable(name: "dataLen", scope: !31, file: !18, line: 37, type: !32)
!31 = distinct !DILexicalBlock(scope: !17, file: !18, line: 35, column: 5)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !33)
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 37, column: 16, scope: !31)
!35 = !DILocation(line: 37, column: 41, scope: !31)
!36 = !DILocation(line: 37, column: 26, scope: !31)
!37 = !DILocalVariable(name: "dest", scope: !31, file: !18, line: 38, type: !6)
!38 = !DILocation(line: 38, column: 16, scope: !31)
!39 = !DILocation(line: 38, column: 31, scope: !31)
!40 = !DILocation(line: 39, column: 22, scope: !31)
!41 = !DILocation(line: 39, column: 28, scope: !31)
!42 = !DILocation(line: 39, column: 15, scope: !31)
!43 = !DILocation(line: 40, column: 27, scope: !31)
!44 = !DILocation(line: 40, column: 9, scope: !31)
!45 = !DILocation(line: 42, column: 1, scope: !17)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_67b_goodG2BSink", scope: !18, file: !18, line: 49, type: !19, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "myStruct", arg: 1, scope: !46, file: !18, line: 49, type: !21)
!48 = !DILocation(line: 49, column: 122, scope: !46)
!49 = !DILocalVariable(name: "data", scope: !46, file: !18, line: 51, type: !6)
!50 = !DILocation(line: 51, column: 12, scope: !46)
!51 = !DILocation(line: 51, column: 28, scope: !46)
!52 = !DILocalVariable(name: "dataLen", scope: !53, file: !18, line: 54, type: !32)
!53 = distinct !DILexicalBlock(scope: !46, file: !18, line: 52, column: 5)
!54 = !DILocation(line: 54, column: 16, scope: !53)
!55 = !DILocation(line: 54, column: 41, scope: !53)
!56 = !DILocation(line: 54, column: 26, scope: !53)
!57 = !DILocalVariable(name: "dest", scope: !53, file: !18, line: 55, type: !6)
!58 = !DILocation(line: 55, column: 16, scope: !53)
!59 = !DILocation(line: 55, column: 31, scope: !53)
!60 = !DILocation(line: 56, column: 22, scope: !53)
!61 = !DILocation(line: 56, column: 28, scope: !53)
!62 = !DILocation(line: 56, column: 15, scope: !53)
!63 = !DILocation(line: 57, column: 27, scope: !53)
!64 = !DILocation(line: 57, column: 9, scope: !53)
!65 = !DILocation(line: 59, column: 1, scope: !46)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_67b_goodB2GSink", scope: !18, file: !18, line: 62, type: !19, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "myStruct", arg: 1, scope: !66, file: !18, line: 62, type: !21)
!68 = !DILocation(line: 62, column: 122, scope: !66)
!69 = !DILocalVariable(name: "data", scope: !66, file: !18, line: 64, type: !6)
!70 = !DILocation(line: 64, column: 12, scope: !66)
!71 = !DILocation(line: 64, column: 28, scope: !66)
!72 = !DILocalVariable(name: "dataLen", scope: !73, file: !18, line: 67, type: !32)
!73 = distinct !DILexicalBlock(scope: !66, file: !18, line: 65, column: 5)
!74 = !DILocation(line: 67, column: 16, scope: !73)
!75 = !DILocation(line: 67, column: 44, scope: !73)
!76 = !DILocation(line: 67, column: 33, scope: !73)
!77 = !DILocation(line: 67, column: 26, scope: !73)
!78 = !DILocalVariable(name: "dest", scope: !73, file: !18, line: 68, type: !6)
!79 = !DILocation(line: 68, column: 16, scope: !73)
!80 = !DILocation(line: 68, column: 31, scope: !73)
!81 = !DILocation(line: 69, column: 22, scope: !73)
!82 = !DILocation(line: 69, column: 28, scope: !73)
!83 = !DILocation(line: 69, column: 15, scope: !73)
!84 = !DILocation(line: 70, column: 31, scope: !73)
!85 = !DILocation(line: 70, column: 20, scope: !73)
!86 = !DILocation(line: 70, column: 9, scope: !73)
!87 = !DILocation(line: 72, column: 1, scope: !66)
