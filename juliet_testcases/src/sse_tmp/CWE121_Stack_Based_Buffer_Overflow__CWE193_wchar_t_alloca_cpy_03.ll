; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03_bad.source to i8*), i64 44, i1 false), !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %call = call i32* @wcscpy(i32* %7, i32* %arraydecay) #5, !dbg !43
  %8 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %8), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 40, align 16, !dbg !76
  %1 = bitcast i8* %0 to i32*, !dbg !77
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = alloca i8, i64 44, align 16, !dbg !80
  %3 = bitcast i8* %2 to i32*, !dbg !81
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !79
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !82
  store i32* %4, i32** %data, align 8, !dbg !85
  %5 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !90
  %7 = load i32*, i32** %data, align 8, !dbg !91
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !92
  %call = call i32* @wcscpy(i32* %7, i32* %arraydecay) #5, !dbg !93
  %8 = load i32*, i32** %data, align 8, !dbg !94
  call void @printWLine(i32* %8), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 40, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %2 = alloca i8, i64 44, align 16, !dbg !106
  %3 = bitcast i8* %2 to i32*, !dbg !107
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !105
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !108
  store i32* %4, i32** %data, align 8, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !116
  %7 = load i32*, i32** %data, align 8, !dbg !117
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !118
  %call = call i32* @wcscpy(i32* %7, i32* %arraydecay) #5, !dbg !119
  %8 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %8), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 37, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 34, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 8)
!32 = !DILocation(line: 37, column: 14, scope: !30)
!33 = !DILocation(line: 38, column: 9, scope: !30)
!34 = !DILocation(line: 38, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !16, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 41, column: 17, scope: !36)
!41 = !DILocation(line: 43, column: 16, scope: !36)
!42 = !DILocation(line: 43, column: 22, scope: !36)
!43 = !DILocation(line: 43, column: 9, scope: !36)
!44 = !DILocation(line: 44, column: 20, scope: !36)
!45 = !DILocation(line: 44, column: 9, scope: !36)
!46 = !DILocation(line: 46, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_03_good", scope: !16, file: !16, line: 99, type: !17, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 101, column: 5, scope: !47)
!49 = !DILocation(line: 102, column: 5, scope: !47)
!50 = !DILocation(line: 103, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 115, type: !52, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!7, !7, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !16, line: 115, type: !7)
!58 = !DILocation(line: 115, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !16, line: 115, type: !54)
!60 = !DILocation(line: 115, column: 27, scope: !51)
!61 = !DILocation(line: 118, column: 22, scope: !51)
!62 = !DILocation(line: 118, column: 12, scope: !51)
!63 = !DILocation(line: 118, column: 5, scope: !51)
!64 = !DILocation(line: 120, column: 5, scope: !51)
!65 = !DILocation(line: 121, column: 5, scope: !51)
!66 = !DILocation(line: 122, column: 5, scope: !51)
!67 = !DILocation(line: 125, column: 5, scope: !51)
!68 = !DILocation(line: 126, column: 5, scope: !51)
!69 = !DILocation(line: 127, column: 5, scope: !51)
!70 = !DILocation(line: 129, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !16, line: 55, type: !4)
!73 = !DILocation(line: 55, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !16, line: 56, type: !4)
!75 = !DILocation(line: 56, column: 15, scope: !71)
!76 = !DILocation(line: 56, column: 42, scope: !71)
!77 = !DILocation(line: 56, column: 31, scope: !71)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !16, line: 57, type: !4)
!79 = !DILocation(line: 57, column: 15, scope: !71)
!80 = !DILocation(line: 57, column: 43, scope: !71)
!81 = !DILocation(line: 57, column: 32, scope: !71)
!82 = !DILocation(line: 67, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !16, line: 64, column: 5)
!84 = distinct !DILexicalBlock(scope: !71, file: !16, line: 58, column: 8)
!85 = !DILocation(line: 67, column: 14, scope: !83)
!86 = !DILocation(line: 68, column: 9, scope: !83)
!87 = !DILocation(line: 68, column: 17, scope: !83)
!88 = !DILocalVariable(name: "source", scope: !89, file: !16, line: 71, type: !37)
!89 = distinct !DILexicalBlock(scope: !71, file: !16, line: 70, column: 5)
!90 = !DILocation(line: 71, column: 17, scope: !89)
!91 = !DILocation(line: 73, column: 16, scope: !89)
!92 = !DILocation(line: 73, column: 22, scope: !89)
!93 = !DILocation(line: 73, column: 9, scope: !89)
!94 = !DILocation(line: 74, column: 20, scope: !89)
!95 = !DILocation(line: 74, column: 9, scope: !89)
!96 = !DILocation(line: 76, column: 1, scope: !71)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !16, line: 81, type: !4)
!99 = !DILocation(line: 81, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !16, line: 82, type: !4)
!101 = !DILocation(line: 82, column: 15, scope: !97)
!102 = !DILocation(line: 82, column: 42, scope: !97)
!103 = !DILocation(line: 82, column: 31, scope: !97)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !16, line: 83, type: !4)
!105 = !DILocation(line: 83, column: 15, scope: !97)
!106 = !DILocation(line: 83, column: 43, scope: !97)
!107 = !DILocation(line: 83, column: 32, scope: !97)
!108 = !DILocation(line: 88, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !16, line: 85, column: 5)
!110 = distinct !DILexicalBlock(scope: !97, file: !16, line: 84, column: 8)
!111 = !DILocation(line: 88, column: 14, scope: !109)
!112 = !DILocation(line: 89, column: 9, scope: !109)
!113 = !DILocation(line: 89, column: 17, scope: !109)
!114 = !DILocalVariable(name: "source", scope: !115, file: !16, line: 92, type: !37)
!115 = distinct !DILexicalBlock(scope: !97, file: !16, line: 91, column: 5)
!116 = !DILocation(line: 92, column: 17, scope: !115)
!117 = !DILocation(line: 94, column: 16, scope: !115)
!118 = !DILocation(line: 94, column: 22, scope: !115)
!119 = !DILocation(line: 94, column: 9, scope: !115)
!120 = !DILocation(line: 95, column: 20, scope: !115)
!121 = !DILocation(line: 95, column: 9, scope: !115)
!122 = !DILocation(line: 97, column: 1, scope: !97)
