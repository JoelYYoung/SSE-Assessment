; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType = type { i8* }

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_34_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  store i8* null, i8** %data, align 8, !dbg !31
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !34
  store i8* %0, i8** %unionFirst, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !39
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !39
  store i8* %1, i8** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !40, metadata !DIExpression()), !dbg !44
  %2 = load i8*, i8** %data1, align 8, !dbg !45
  %call = call i64 @strlen(i8* %2) #5, !dbg !46
  store i64 %call, i64* %dataLen, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !47, metadata !DIExpression()), !dbg !48
  %3 = load i64, i64* %dataLen, align 8, !dbg !49
  %add = add i64 %3, 1, !dbg !49
  %mul = mul i64 %add, 4, !dbg !49
  %4 = alloca i8, i64 %mul, align 16, !dbg !49
  store i8* %4, i8** %dest, align 8, !dbg !48
  %5 = load i8*, i8** %dest, align 8, !dbg !50
  %6 = bitcast i8* %5 to i32*, !dbg !50
  %7 = load i8*, i8** %data1, align 8, !dbg !51
  %8 = bitcast i8* %7 to i32*, !dbg !51
  %call2 = call i32* @wcscpy(i32* %6, i32* %8) #6, !dbg !52
  %9 = load i8*, i8** %dest, align 8, !dbg !53
  call void @printLine(i8* %9), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE135_34_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  call void @goodB2G(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_34_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE135_34_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8** %data, align 8, !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !86
  store i8* %0, i8** %unionFirst, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !88, metadata !DIExpression()), !dbg !90
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !91
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !91
  store i8* %1, i8** %data1, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = load i8*, i8** %data1, align 8, !dbg !95
  %call = call i64 @strlen(i8* %2) #5, !dbg !96
  store i64 %call, i64* %dataLen, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !97, metadata !DIExpression()), !dbg !98
  %3 = load i64, i64* %dataLen, align 8, !dbg !99
  %add = add i64 %3, 1, !dbg !99
  %mul = mul i64 %add, 1, !dbg !99
  %4 = alloca i8, i64 %mul, align 16, !dbg !99
  store i8* %4, i8** %dest, align 8, !dbg !98
  %5 = load i8*, i8** %dest, align 8, !dbg !100
  %6 = load i8*, i8** %data1, align 8, !dbg !101
  %call2 = call i8* @strcpy(i8* %5, i8* %6) #6, !dbg !102
  %7 = load i8*, i8** %dest, align 8, !dbg !103
  call void @printLine(i8* %7), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %dataLen = alloca i64, align 8
  %dest = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* null, i8** %data, align 8, !dbg !111
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !114
  store i8* %0, i8** %unionFirst, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !116, metadata !DIExpression()), !dbg !118
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType* %myUnion to i8**, !dbg !119
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !119
  store i8* %1, i8** %data1, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !120, metadata !DIExpression()), !dbg !122
  %2 = load i8*, i8** %data1, align 8, !dbg !123
  %3 = bitcast i8* %2 to i32*, !dbg !124
  %call = call i64 @wcslen(i32* %3) #5, !dbg !125
  store i64 %call, i64* %dataLen, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !126, metadata !DIExpression()), !dbg !127
  %4 = load i64, i64* %dataLen, align 8, !dbg !128
  %add = add i64 %4, 1, !dbg !128
  %mul = mul i64 %add, 4, !dbg !128
  %5 = alloca i8, i64 %mul, align 16, !dbg !128
  store i8* %5, i8** %dest, align 8, !dbg !127
  %6 = load i8*, i8** %dest, align 8, !dbg !129
  %7 = bitcast i8* %6 to i32*, !dbg !129
  %8 = load i8*, i8** %data1, align 8, !dbg !130
  %9 = bitcast i8* %8 to i32*, !dbg !130
  %call2 = call i32* @wcscpy(i32* %7, i32* %9) #6, !dbg !131
  %10 = load i8*, i8** %dest, align 8, !dbg !132
  %11 = bitcast i8* %10 to i32*, !dbg !133
  call void @printWLine(i32* %11), !dbg !134
  ret void, !dbg !135
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_34_bad", scope: !19, file: !19, line: 33, type: !20, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_34.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 35, type: !4)
!23 = !DILocation(line: 35, column: 12, scope: !18)
!24 = !DILocalVariable(name: "myUnion", scope: !18, file: !19, line: 36, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_34_unionType", file: !19, line: 29, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !19, line: 25, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !19, line: 27, baseType: !4, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !19, line: 28, baseType: !4, size: 64)
!30 = !DILocation(line: 36, column: 61, scope: !18)
!31 = !DILocation(line: 37, column: 10, scope: !18)
!32 = !DILocation(line: 39, column: 10, scope: !18)
!33 = !DILocation(line: 40, column: 26, scope: !18)
!34 = !DILocation(line: 40, column: 13, scope: !18)
!35 = !DILocation(line: 40, column: 24, scope: !18)
!36 = !DILocalVariable(name: "data", scope: !37, file: !19, line: 42, type: !4)
!37 = distinct !DILexicalBlock(scope: !18, file: !19, line: 41, column: 5)
!38 = !DILocation(line: 42, column: 16, scope: !37)
!39 = !DILocation(line: 42, column: 31, scope: !37)
!40 = !DILocalVariable(name: "dataLen", scope: !41, file: !19, line: 45, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !19, line: 43, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !10, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 45, column: 20, scope: !41)
!45 = !DILocation(line: 45, column: 45, scope: !41)
!46 = !DILocation(line: 45, column: 30, scope: !41)
!47 = !DILocalVariable(name: "dest", scope: !41, file: !19, line: 46, type: !4)
!48 = !DILocation(line: 46, column: 20, scope: !41)
!49 = !DILocation(line: 46, column: 35, scope: !41)
!50 = !DILocation(line: 47, column: 26, scope: !41)
!51 = !DILocation(line: 47, column: 32, scope: !41)
!52 = !DILocation(line: 47, column: 19, scope: !41)
!53 = !DILocation(line: 48, column: 31, scope: !41)
!54 = !DILocation(line: 48, column: 13, scope: !41)
!55 = !DILocation(line: 51, column: 1, scope: !18)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_34_good", scope: !19, file: !19, line: 99, type: !20, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 101, column: 5, scope: !56)
!58 = !DILocation(line: 102, column: 5, scope: !56)
!59 = !DILocation(line: 103, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 113, type: !61, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !19, line: 113, type: !11)
!65 = !DILocation(line: 113, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !19, line: 113, type: !63)
!67 = !DILocation(line: 113, column: 27, scope: !60)
!68 = !DILocation(line: 116, column: 22, scope: !60)
!69 = !DILocation(line: 116, column: 12, scope: !60)
!70 = !DILocation(line: 116, column: 5, scope: !60)
!71 = !DILocation(line: 118, column: 5, scope: !60)
!72 = !DILocation(line: 119, column: 5, scope: !60)
!73 = !DILocation(line: 120, column: 5, scope: !60)
!74 = !DILocation(line: 123, column: 5, scope: !60)
!75 = !DILocation(line: 124, column: 5, scope: !60)
!76 = !DILocation(line: 125, column: 5, scope: !60)
!77 = !DILocation(line: 127, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !19, line: 60, type: !4)
!80 = !DILocation(line: 60, column: 12, scope: !78)
!81 = !DILocalVariable(name: "myUnion", scope: !78, file: !19, line: 61, type: !25)
!82 = !DILocation(line: 61, column: 61, scope: !78)
!83 = !DILocation(line: 62, column: 10, scope: !78)
!84 = !DILocation(line: 64, column: 10, scope: !78)
!85 = !DILocation(line: 65, column: 26, scope: !78)
!86 = !DILocation(line: 65, column: 13, scope: !78)
!87 = !DILocation(line: 65, column: 24, scope: !78)
!88 = !DILocalVariable(name: "data", scope: !89, file: !19, line: 67, type: !4)
!89 = distinct !DILexicalBlock(scope: !78, file: !19, line: 66, column: 5)
!90 = !DILocation(line: 67, column: 16, scope: !89)
!91 = !DILocation(line: 67, column: 31, scope: !89)
!92 = !DILocalVariable(name: "dataLen", scope: !93, file: !19, line: 70, type: !42)
!93 = distinct !DILexicalBlock(scope: !89, file: !19, line: 68, column: 9)
!94 = !DILocation(line: 70, column: 20, scope: !93)
!95 = !DILocation(line: 70, column: 45, scope: !93)
!96 = !DILocation(line: 70, column: 30, scope: !93)
!97 = !DILocalVariable(name: "dest", scope: !93, file: !19, line: 71, type: !4)
!98 = !DILocation(line: 71, column: 20, scope: !93)
!99 = !DILocation(line: 71, column: 35, scope: !93)
!100 = !DILocation(line: 72, column: 26, scope: !93)
!101 = !DILocation(line: 72, column: 32, scope: !93)
!102 = !DILocation(line: 72, column: 19, scope: !93)
!103 = !DILocation(line: 73, column: 31, scope: !93)
!104 = !DILocation(line: 73, column: 13, scope: !93)
!105 = !DILocation(line: 76, column: 1, scope: !78)
!106 = distinct !DISubprogram(name: "goodB2G", scope: !19, file: !19, line: 79, type: !20, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !19, line: 81, type: !4)
!108 = !DILocation(line: 81, column: 12, scope: !106)
!109 = !DILocalVariable(name: "myUnion", scope: !106, file: !19, line: 82, type: !25)
!110 = !DILocation(line: 82, column: 61, scope: !106)
!111 = !DILocation(line: 83, column: 10, scope: !106)
!112 = !DILocation(line: 85, column: 10, scope: !106)
!113 = !DILocation(line: 86, column: 26, scope: !106)
!114 = !DILocation(line: 86, column: 13, scope: !106)
!115 = !DILocation(line: 86, column: 24, scope: !106)
!116 = !DILocalVariable(name: "data", scope: !117, file: !19, line: 88, type: !4)
!117 = distinct !DILexicalBlock(scope: !106, file: !19, line: 87, column: 5)
!118 = !DILocation(line: 88, column: 16, scope: !117)
!119 = !DILocation(line: 88, column: 31, scope: !117)
!120 = !DILocalVariable(name: "dataLen", scope: !121, file: !19, line: 91, type: !42)
!121 = distinct !DILexicalBlock(scope: !117, file: !19, line: 89, column: 9)
!122 = !DILocation(line: 91, column: 20, scope: !121)
!123 = !DILocation(line: 91, column: 48, scope: !121)
!124 = !DILocation(line: 91, column: 37, scope: !121)
!125 = !DILocation(line: 91, column: 30, scope: !121)
!126 = !DILocalVariable(name: "dest", scope: !121, file: !19, line: 92, type: !4)
!127 = !DILocation(line: 92, column: 20, scope: !121)
!128 = !DILocation(line: 92, column: 35, scope: !121)
!129 = !DILocation(line: 93, column: 26, scope: !121)
!130 = !DILocation(line: 93, column: 32, scope: !121)
!131 = !DILocation(line: 93, column: 19, scope: !121)
!132 = !DILocation(line: 94, column: 35, scope: !121)
!133 = !DILocation(line: 94, column: 24, scope: !121)
!134 = !DILocation(line: 94, column: 13, scope: !121)
!135 = !DILocation(line: 97, column: 1, scope: !106)
