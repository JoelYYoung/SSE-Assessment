; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType = type { i8* }

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_67b_badSink(i8* %myStruct.coerce) #0 !dbg !17 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0, !dbg !29
  %0 = load i8*, i8** %structFirst, align 8, !dbg !29
  store i8* %0, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !30, metadata !DIExpression()), !dbg !34
  %1 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i64 @strlen(i8* %1) #6, !dbg !36
  store i64 %call, i64* %dataLen, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !37, metadata !DIExpression()), !dbg !38
  %2 = load i64, i64* %dataLen, align 8, !dbg !39
  %add = add i64 %2, 1, !dbg !40
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !41
  store i8* %call1, i8** %dest, align 8, !dbg !38
  %3 = load i8*, i8** %dest, align 8, !dbg !42
  %cmp = icmp eq i8* %3, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !48
  %5 = bitcast i8* %4 to i32*, !dbg !48
  %6 = load i8*, i8** %data, align 8, !dbg !49
  %7 = bitcast i8* %6 to i32*, !dbg !49
  %call2 = call i32* @wcscpy(i32* %5, i32* %7) #7, !dbg !50
  %8 = load i8*, i8** %dest, align 8, !dbg !51
  call void @printLine(i8* %8), !dbg !52
  %9 = load i8*, i8** %dest, align 8, !dbg !53
  call void @free(i8* %9) #7, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !56 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i8** %data, metadata !59, metadata !DIExpression()), !dbg !60
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0, !dbg !61
  %0 = load i8*, i8** %structFirst, align 8, !dbg !61
  store i8* %0, i8** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !62, metadata !DIExpression()), !dbg !64
  %1 = load i8*, i8** %data, align 8, !dbg !65
  %call = call i64 @strlen(i8* %1) #6, !dbg !66
  store i64 %call, i64* %dataLen, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !67, metadata !DIExpression()), !dbg !68
  %2 = load i64, i64* %dataLen, align 8, !dbg !69
  %add = add i64 %2, 1, !dbg !70
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 1) #7, !dbg !71
  store i8* %call1, i8** %dest, align 8, !dbg !68
  %3 = load i8*, i8** %dest, align 8, !dbg !72
  %cmp = icmp eq i8* %3, null, !dbg !74
  br i1 %cmp, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %dest, align 8, !dbg !78
  %5 = load i8*, i8** %data, align 8, !dbg !79
  %call2 = call i8* @strcpy(i8* %4, i8* %5) #7, !dbg !80
  %6 = load i8*, i8** %dest, align 8, !dbg !81
  call void @printLine(i8* %6), !dbg !82
  %7 = load i8*, i8** %dest, align 8, !dbg !83
  call void @free(i8* %7) #7, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE135_67b_goodB2GSink(i8* %myStruct.coerce) #0 !dbg !86 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType, align 8
  %data = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType* %myStruct, i32 0, i32 0, !dbg !91
  %0 = load i8*, i8** %structFirst, align 8, !dbg !91
  store i8* %0, i8** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !92, metadata !DIExpression()), !dbg !94
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %2 = bitcast i8* %1 to i32*, !dbg !96
  %call = call i64 @wcslen(i32* %2) #6, !dbg !97
  store i64 %call, i64* %dataLen, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !98, metadata !DIExpression()), !dbg !99
  %3 = load i64, i64* %dataLen, align 8, !dbg !100
  %add = add i64 %3, 1, !dbg !101
  %call1 = call noalias align 16 i8* @calloc(i64 %add, i64 4) #7, !dbg !102
  store i8* %call1, i8** %dest, align 8, !dbg !99
  %4 = load i8*, i8** %dest, align 8, !dbg !103
  %cmp = icmp eq i8* %4, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %dest, align 8, !dbg !109
  %6 = bitcast i8* %5 to i32*, !dbg !109
  %7 = load i8*, i8** %data, align 8, !dbg !110
  %8 = bitcast i8* %7 to i32*, !dbg !110
  %call2 = call i32* @wcscpy(i32* %6, i32* %8) #7, !dbg !111
  %9 = load i8*, i8** %dest, align 8, !dbg !112
  %10 = bitcast i8* %9 to i32*, !dbg !113
  call void @printWLine(i32* %10), !dbg !114
  %11 = load i8*, i8** %dest, align 8, !dbg !115
  call void @free(i8* %11) #7, !dbg !116
  ret void, !dbg !117
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #2

declare dso_local void @printWLine(i32*) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_67b.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_67b_badSink", scope: !18, file: !18, line: 29, type: !19, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE135_67b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType", file: !18, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__CWE135_67_structType", file: !18, line: 22, size: 64, elements: !23)
!23 = !{!24}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !22, file: !18, line: 24, baseType: !6, size: 64)
!25 = !DILocalVariable(name: "myStruct", arg: 1, scope: !17, file: !18, line: 29, type: !21)
!26 = !DILocation(line: 29, column: 116, scope: !17)
!27 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 31, type: !6)
!28 = !DILocation(line: 31, column: 12, scope: !17)
!29 = !DILocation(line: 31, column: 28, scope: !17)
!30 = !DILocalVariable(name: "dataLen", scope: !31, file: !18, line: 34, type: !32)
!31 = distinct !DILexicalBlock(scope: !17, file: !18, line: 32, column: 5)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !9, line: 46, baseType: !33)
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 34, column: 16, scope: !31)
!35 = !DILocation(line: 34, column: 41, scope: !31)
!36 = !DILocation(line: 34, column: 26, scope: !31)
!37 = !DILocalVariable(name: "dest", scope: !31, file: !18, line: 35, type: !6)
!38 = !DILocation(line: 35, column: 16, scope: !31)
!39 = !DILocation(line: 35, column: 38, scope: !31)
!40 = !DILocation(line: 35, column: 45, scope: !31)
!41 = !DILocation(line: 35, column: 31, scope: !31)
!42 = !DILocation(line: 36, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !31, file: !18, line: 36, column: 13)
!44 = !DILocation(line: 36, column: 18, scope: !43)
!45 = !DILocation(line: 36, column: 13, scope: !31)
!46 = !DILocation(line: 36, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !18, line: 36, column: 27)
!48 = !DILocation(line: 37, column: 22, scope: !31)
!49 = !DILocation(line: 37, column: 28, scope: !31)
!50 = !DILocation(line: 37, column: 15, scope: !31)
!51 = !DILocation(line: 38, column: 27, scope: !31)
!52 = !DILocation(line: 38, column: 9, scope: !31)
!53 = !DILocation(line: 39, column: 14, scope: !31)
!54 = !DILocation(line: 39, column: 9, scope: !31)
!55 = !DILocation(line: 41, column: 1, scope: !17)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_67b_goodG2BSink", scope: !18, file: !18, line: 48, type: !19, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "myStruct", arg: 1, scope: !56, file: !18, line: 48, type: !21)
!58 = !DILocation(line: 48, column: 120, scope: !56)
!59 = !DILocalVariable(name: "data", scope: !56, file: !18, line: 50, type: !6)
!60 = !DILocation(line: 50, column: 12, scope: !56)
!61 = !DILocation(line: 50, column: 28, scope: !56)
!62 = !DILocalVariable(name: "dataLen", scope: !63, file: !18, line: 53, type: !32)
!63 = distinct !DILexicalBlock(scope: !56, file: !18, line: 51, column: 5)
!64 = !DILocation(line: 53, column: 16, scope: !63)
!65 = !DILocation(line: 53, column: 41, scope: !63)
!66 = !DILocation(line: 53, column: 26, scope: !63)
!67 = !DILocalVariable(name: "dest", scope: !63, file: !18, line: 54, type: !6)
!68 = !DILocation(line: 54, column: 16, scope: !63)
!69 = !DILocation(line: 54, column: 38, scope: !63)
!70 = !DILocation(line: 54, column: 45, scope: !63)
!71 = !DILocation(line: 54, column: 31, scope: !63)
!72 = !DILocation(line: 55, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !63, file: !18, line: 55, column: 13)
!74 = !DILocation(line: 55, column: 18, scope: !73)
!75 = !DILocation(line: 55, column: 13, scope: !63)
!76 = !DILocation(line: 55, column: 28, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !18, line: 55, column: 27)
!78 = !DILocation(line: 56, column: 22, scope: !63)
!79 = !DILocation(line: 56, column: 28, scope: !63)
!80 = !DILocation(line: 56, column: 15, scope: !63)
!81 = !DILocation(line: 57, column: 27, scope: !63)
!82 = !DILocation(line: 57, column: 9, scope: !63)
!83 = !DILocation(line: 58, column: 14, scope: !63)
!84 = !DILocation(line: 58, column: 9, scope: !63)
!85 = !DILocation(line: 60, column: 1, scope: !56)
!86 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE135_67b_goodB2GSink", scope: !18, file: !18, line: 63, type: !19, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "myStruct", arg: 1, scope: !86, file: !18, line: 63, type: !21)
!88 = !DILocation(line: 63, column: 120, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !18, line: 65, type: !6)
!90 = !DILocation(line: 65, column: 12, scope: !86)
!91 = !DILocation(line: 65, column: 28, scope: !86)
!92 = !DILocalVariable(name: "dataLen", scope: !93, file: !18, line: 68, type: !32)
!93 = distinct !DILexicalBlock(scope: !86, file: !18, line: 66, column: 5)
!94 = !DILocation(line: 68, column: 16, scope: !93)
!95 = !DILocation(line: 68, column: 44, scope: !93)
!96 = !DILocation(line: 68, column: 33, scope: !93)
!97 = !DILocation(line: 68, column: 26, scope: !93)
!98 = !DILocalVariable(name: "dest", scope: !93, file: !18, line: 69, type: !6)
!99 = !DILocation(line: 69, column: 16, scope: !93)
!100 = !DILocation(line: 69, column: 38, scope: !93)
!101 = !DILocation(line: 69, column: 45, scope: !93)
!102 = !DILocation(line: 69, column: 31, scope: !93)
!103 = !DILocation(line: 70, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !93, file: !18, line: 70, column: 13)
!105 = !DILocation(line: 70, column: 18, scope: !104)
!106 = !DILocation(line: 70, column: 13, scope: !93)
!107 = !DILocation(line: 70, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !18, line: 70, column: 27)
!109 = !DILocation(line: 71, column: 22, scope: !93)
!110 = !DILocation(line: 71, column: 28, scope: !93)
!111 = !DILocation(line: 71, column: 15, scope: !93)
!112 = !DILocation(line: 72, column: 31, scope: !93)
!113 = !DILocation(line: 72, column: 20, scope: !93)
!114 = !DILocation(line: 72, column: 9, scope: !93)
!115 = !DILocation(line: 73, column: 14, scope: !93)
!116 = !DILocation(line: 73, column: 9, scope: !93)
!117 = !DILocation(line: 75, column: 1, scope: !86)
