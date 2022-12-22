; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType = type { i8* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 10, align 16, !dbg !28
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %1 = alloca i8, i64 11, align 16, !dbg !31
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !30
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  store i8* %2, i8** %data, align 8, !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !37
  store i8* %4, i8** %unionFirst, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !42
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !42
  store i8* %5, i8** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !48
  %7 = load i8*, i8** %data1, align 8, !dbg !49
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !50
  %call = call i8* @strcpy(i8* %7, i8* %arraydecay) #5, !dbg !51
  %8 = load i8*, i8** %data1, align 8, !dbg !52
  call void @printLine(i8* %8), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType* %myUnion, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 10, align 16, !dbg !84
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %1 = alloca i8, i64 11, align 16, !dbg !87
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !86
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !88
  store i8* %2, i8** %data, align 8, !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !93
  store i8* %4, i8** %unionFirst, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !95, metadata !DIExpression()), !dbg !97
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType* %myUnion to i8**, !dbg !98
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !98
  store i8* %5, i8** %data1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !101
  %7 = load i8*, i8** %data1, align 8, !dbg !102
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !103
  %call = call i8* @strcpy(i8* %7, i8* %arraydecay) #5, !dbg !104
  %8 = load i8*, i8** %data1, align 8, !dbg !105
  call void @printLine(i8* %8), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_bad", scope: !14, file: !14, line: 34, type: !15, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 36, type: !4)
!18 = !DILocation(line: 36, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 37, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_unionType", file: !14, line: 30, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 26, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !14, line: 28, baseType: !4, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !14, line: 29, baseType: !4, size: 64)
!25 = !DILocation(line: 37, column: 77, scope: !13)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 38, type: !4)
!27 = !DILocation(line: 38, column: 12, scope: !13)
!28 = !DILocation(line: 38, column: 36, scope: !13)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 39, type: !4)
!30 = !DILocation(line: 39, column: 12, scope: !13)
!31 = !DILocation(line: 39, column: 37, scope: !13)
!32 = !DILocation(line: 42, column: 12, scope: !13)
!33 = !DILocation(line: 42, column: 10, scope: !13)
!34 = !DILocation(line: 43, column: 5, scope: !13)
!35 = !DILocation(line: 43, column: 13, scope: !13)
!36 = !DILocation(line: 44, column: 26, scope: !13)
!37 = !DILocation(line: 44, column: 13, scope: !13)
!38 = !DILocation(line: 44, column: 24, scope: !13)
!39 = !DILocalVariable(name: "data", scope: !40, file: !14, line: 46, type: !4)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 45, column: 5)
!41 = !DILocation(line: 46, column: 16, scope: !40)
!42 = !DILocation(line: 46, column: 31, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 48, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !14, line: 47, column: 9)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 48, column: 18, scope: !44)
!49 = !DILocation(line: 50, column: 20, scope: !44)
!50 = !DILocation(line: 50, column: 26, scope: !44)
!51 = !DILocation(line: 50, column: 13, scope: !44)
!52 = !DILocation(line: 51, column: 23, scope: !44)
!53 = !DILocation(line: 51, column: 13, scope: !44)
!54 = !DILocation(line: 54, column: 1, scope: !13)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_34_good", scope: !14, file: !14, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 85, column: 5, scope: !55)
!57 = !DILocation(line: 86, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 97, type: !59, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 97, type: !61)
!64 = !DILocation(line: 97, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 97, type: !62)
!66 = !DILocation(line: 97, column: 27, scope: !58)
!67 = !DILocation(line: 100, column: 22, scope: !58)
!68 = !DILocation(line: 100, column: 12, scope: !58)
!69 = !DILocation(line: 100, column: 5, scope: !58)
!70 = !DILocation(line: 102, column: 5, scope: !58)
!71 = !DILocation(line: 103, column: 5, scope: !58)
!72 = !DILocation(line: 104, column: 5, scope: !58)
!73 = !DILocation(line: 107, column: 5, scope: !58)
!74 = !DILocation(line: 108, column: 5, scope: !58)
!75 = !DILocation(line: 109, column: 5, scope: !58)
!76 = !DILocation(line: 111, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 63, type: !4)
!79 = !DILocation(line: 63, column: 12, scope: !77)
!80 = !DILocalVariable(name: "myUnion", scope: !77, file: !14, line: 64, type: !20)
!81 = !DILocation(line: 64, column: 77, scope: !77)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !14, line: 65, type: !4)
!83 = !DILocation(line: 65, column: 12, scope: !77)
!84 = !DILocation(line: 65, column: 36, scope: !77)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !14, line: 66, type: !4)
!86 = !DILocation(line: 66, column: 12, scope: !77)
!87 = !DILocation(line: 66, column: 37, scope: !77)
!88 = !DILocation(line: 69, column: 12, scope: !77)
!89 = !DILocation(line: 69, column: 10, scope: !77)
!90 = !DILocation(line: 70, column: 5, scope: !77)
!91 = !DILocation(line: 70, column: 13, scope: !77)
!92 = !DILocation(line: 71, column: 26, scope: !77)
!93 = !DILocation(line: 71, column: 13, scope: !77)
!94 = !DILocation(line: 71, column: 24, scope: !77)
!95 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 73, type: !4)
!96 = distinct !DILexicalBlock(scope: !77, file: !14, line: 72, column: 5)
!97 = !DILocation(line: 73, column: 16, scope: !96)
!98 = !DILocation(line: 73, column: 31, scope: !96)
!99 = !DILocalVariable(name: "source", scope: !100, file: !14, line: 75, type: !45)
!100 = distinct !DILexicalBlock(scope: !96, file: !14, line: 74, column: 9)
!101 = !DILocation(line: 75, column: 18, scope: !100)
!102 = !DILocation(line: 77, column: 20, scope: !100)
!103 = !DILocation(line: 77, column: 26, scope: !100)
!104 = !DILocation(line: 77, column: 13, scope: !100)
!105 = !DILocation(line: 78, column: 23, scope: !100)
!106 = !DILocation(line: 78, column: 13, scope: !100)
!107 = !DILocation(line: 81, column: 1, scope: !77)
