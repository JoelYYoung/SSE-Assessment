; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !27
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !28
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %0 = load i32*, i32** %data.addr, align 8, !dbg !31
  %1 = bitcast i32* %0 to i8*, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !32
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !32
  %3 = load i32*, i32** %data.addr, align 8, !dbg !33
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx2, align 4, !dbg !34
  %4 = load i32*, i32** %data.addr, align 8, !dbg !35
  call void @printWLine(i32* %4), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_bad() #0 !dbg !38 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = alloca i8, i64 200, align 16, !dbg !45
  %1 = bitcast i8* %0 to i32*, !dbg !46
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !47, metadata !DIExpression()), !dbg !48
  %2 = alloca i8, i64 400, align 16, !dbg !49
  %3 = bitcast i8* %2 to i32*, !dbg !50
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !48
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !51
  store i32* %4, i32** %data, align 8, !dbg !52
  %5 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  %6 = load i32*, i32** %data, align 8, !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_badSink(i32* %6), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_goodG2BSink(i32* %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !61, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !64
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !65
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !67
  %0 = load i32*, i32** %data.addr, align 8, !dbg !68
  %1 = bitcast i32* %0 to i8*, !dbg !69
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !69
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !69
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %1, i8* align 16 %2, i64 400, i1 false), !dbg !69
  %3 = load i32*, i32** %data.addr, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !70
  store i32 0, i32* %arrayidx2, align 4, !dbg !71
  %4 = load i32*, i32** %data.addr, align 8, !dbg !72
  call void @printWLine(i32* %4), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 200, align 16, !dbg !103
  %1 = bitcast i8* %0 to i32*, !dbg !104
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %2 = alloca i8, i64 400, align 16, !dbg !107
  %3 = bitcast i8* %2 to i32*, !dbg !108
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !106
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !109
  store i32* %4, i32** %data, align 8, !dbg !110
  %5 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %6 = load i32*, i32** %data, align 8, !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_goodG2BSink(i32* %6), !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 23, type: !4)
!20 = !DILocation(line: 23, column: 93, scope: !15)
!21 = !DILocalVariable(name: "source", scope: !22, file: !16, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 27, column: 17, scope: !22)
!28 = !DILocation(line: 27, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 9, scope: !22)
!30 = !DILocation(line: 28, column: 23, scope: !22)
!31 = !DILocation(line: 30, column: 17, scope: !22)
!32 = !DILocation(line: 30, column: 9, scope: !22)
!33 = !DILocation(line: 31, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 21, scope: !22)
!35 = !DILocation(line: 32, column: 20, scope: !22)
!36 = !DILocation(line: 32, column: 9, scope: !22)
!37 = !DILocation(line: 34, column: 1, scope: !15)
!38 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_bad", scope: !16, file: !16, line: 36, type: !39, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !16, line: 38, type: !4)
!42 = !DILocation(line: 38, column: 15, scope: !38)
!43 = !DILocalVariable(name: "dataBadBuffer", scope: !38, file: !16, line: 39, type: !4)
!44 = !DILocation(line: 39, column: 15, scope: !38)
!45 = !DILocation(line: 39, column: 42, scope: !38)
!46 = !DILocation(line: 39, column: 31, scope: !38)
!47 = !DILocalVariable(name: "dataGoodBuffer", scope: !38, file: !16, line: 40, type: !4)
!48 = !DILocation(line: 40, column: 15, scope: !38)
!49 = !DILocation(line: 40, column: 43, scope: !38)
!50 = !DILocation(line: 40, column: 32, scope: !38)
!51 = !DILocation(line: 43, column: 12, scope: !38)
!52 = !DILocation(line: 43, column: 10, scope: !38)
!53 = !DILocation(line: 44, column: 5, scope: !38)
!54 = !DILocation(line: 44, column: 13, scope: !38)
!55 = !DILocation(line: 45, column: 82, scope: !38)
!56 = !DILocation(line: 45, column: 5, scope: !38)
!57 = !DILocation(line: 46, column: 1, scope: !38)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_goodG2BSink", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !16, line: 52, type: !4)
!60 = !DILocation(line: 52, column: 97, scope: !58)
!61 = !DILocalVariable(name: "source", scope: !62, file: !16, line: 55, type: !23)
!62 = distinct !DILexicalBlock(scope: !58, file: !16, line: 54, column: 5)
!63 = !DILocation(line: 55, column: 17, scope: !62)
!64 = !DILocation(line: 56, column: 17, scope: !62)
!65 = !DILocation(line: 56, column: 9, scope: !62)
!66 = !DILocation(line: 57, column: 9, scope: !62)
!67 = !DILocation(line: 57, column: 23, scope: !62)
!68 = !DILocation(line: 59, column: 17, scope: !62)
!69 = !DILocation(line: 59, column: 9, scope: !62)
!70 = !DILocation(line: 60, column: 9, scope: !62)
!71 = !DILocation(line: 60, column: 21, scope: !62)
!72 = !DILocation(line: 61, column: 20, scope: !62)
!73 = !DILocation(line: 61, column: 9, scope: !62)
!74 = !DILocation(line: 63, column: 1, scope: !58)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_41_good", scope: !16, file: !16, line: 77, type: !39, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 79, column: 5, scope: !75)
!77 = !DILocation(line: 80, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 92, type: !79, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !16, line: 92, type: !7)
!85 = !DILocation(line: 92, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !16, line: 92, type: !81)
!87 = !DILocation(line: 92, column: 27, scope: !78)
!88 = !DILocation(line: 95, column: 22, scope: !78)
!89 = !DILocation(line: 95, column: 12, scope: !78)
!90 = !DILocation(line: 95, column: 5, scope: !78)
!91 = !DILocation(line: 97, column: 5, scope: !78)
!92 = !DILocation(line: 98, column: 5, scope: !78)
!93 = !DILocation(line: 99, column: 5, scope: !78)
!94 = !DILocation(line: 102, column: 5, scope: !78)
!95 = !DILocation(line: 103, column: 5, scope: !78)
!96 = !DILocation(line: 104, column: 5, scope: !78)
!97 = !DILocation(line: 106, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 66, type: !39, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !16, line: 68, type: !4)
!100 = !DILocation(line: 68, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !16, line: 69, type: !4)
!102 = !DILocation(line: 69, column: 15, scope: !98)
!103 = !DILocation(line: 69, column: 42, scope: !98)
!104 = !DILocation(line: 69, column: 31, scope: !98)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !16, line: 70, type: !4)
!106 = !DILocation(line: 70, column: 15, scope: !98)
!107 = !DILocation(line: 70, column: 43, scope: !98)
!108 = !DILocation(line: 70, column: 32, scope: !98)
!109 = !DILocation(line: 72, column: 12, scope: !98)
!110 = !DILocation(line: 72, column: 10, scope: !98)
!111 = !DILocation(line: 73, column: 5, scope: !98)
!112 = !DILocation(line: 73, column: 13, scope: !98)
!113 = !DILocation(line: 74, column: 86, scope: !98)
!114 = !DILocation(line: 74, column: 5, scope: !98)
!115 = !DILocation(line: 75, column: 1, scope: !98)
