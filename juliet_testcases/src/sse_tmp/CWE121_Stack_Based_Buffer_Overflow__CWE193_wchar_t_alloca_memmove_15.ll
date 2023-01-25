; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad() #0 !dbg !15 {
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
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad.source to i8*), i64 44, i1 false), !dbg !38
  %7 = load i32*, i32** %data, align 8, !dbg !39
  %8 = bitcast i32* %7 to i8*, !dbg !40
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !40
  %9 = bitcast i32* %arraydecay to i8*, !dbg !40
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !41
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !42
  %add = add i64 %call, 1, !dbg !43
  %mul = mul i64 %add, 4, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !40
  %10 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %10), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 40, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %2 = alloca i8, i64 44, align 16, !dbg !81
  %3 = bitcast i8* %2 to i32*, !dbg !82
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !80
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !83
  store i32* %4, i32** %data, align 8, !dbg !84
  %5 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !89
  %7 = load i32*, i32** %data, align 8, !dbg !90
  %8 = bitcast i32* %7 to i8*, !dbg !91
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !91
  %9 = bitcast i32* %arraydecay to i8*, !dbg !91
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !92
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !93
  %add = add i64 %call, 1, !dbg !94
  %mul = mul i64 %add, 4, !dbg !95
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !91
  %10 = load i32*, i32** %data, align 8, !dbg !96
  call void @printWLine(i32* %10), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 40, align 16, !dbg !104
  %1 = bitcast i8* %0 to i32*, !dbg !105
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %2 = alloca i8, i64 44, align 16, !dbg !108
  %3 = bitcast i8* %2 to i32*, !dbg !109
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !107
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  store i32* %4, i32** %data, align 8, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !116
  %7 = load i32*, i32** %data, align 8, !dbg !117
  %8 = bitcast i32* %7 to i8*, !dbg !118
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !118
  %9 = bitcast i32* %arraydecay to i8*, !dbg !118
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !119
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !120
  %add = add i64 %call, 1, !dbg !121
  %mul = mul i64 %add, 4, !dbg !122
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !118
  %10 = load i32*, i32** %data, align 8, !dbg !123
  call void @printWLine(i32* %10), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 38, column: 16, scope: !15)
!30 = !DILocation(line: 38, column: 14, scope: !15)
!31 = !DILocation(line: 39, column: 9, scope: !15)
!32 = !DILocation(line: 39, column: 17, scope: !15)
!33 = !DILocalVariable(name: "source", scope: !34, file: !16, line: 47, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 46, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 47, column: 17, scope: !34)
!39 = !DILocation(line: 50, column: 17, scope: !34)
!40 = !DILocation(line: 50, column: 9, scope: !34)
!41 = !DILocation(line: 50, column: 39, scope: !34)
!42 = !DILocation(line: 50, column: 32, scope: !34)
!43 = !DILocation(line: 50, column: 47, scope: !34)
!44 = !DILocation(line: 50, column: 52, scope: !34)
!45 = !DILocation(line: 51, column: 20, scope: !34)
!46 = !DILocation(line: 51, column: 9, scope: !34)
!47 = !DILocation(line: 53, column: 1, scope: !15)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_15_good", scope: !16, file: !16, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 117, column: 5, scope: !48)
!50 = !DILocation(line: 118, column: 5, scope: !48)
!51 = !DILocation(line: 119, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 131, type: !53, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !16, line: 131, type: !7)
!59 = !DILocation(line: 131, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !16, line: 131, type: !55)
!61 = !DILocation(line: 131, column: 27, scope: !52)
!62 = !DILocation(line: 134, column: 22, scope: !52)
!63 = !DILocation(line: 134, column: 12, scope: !52)
!64 = !DILocation(line: 134, column: 5, scope: !52)
!65 = !DILocation(line: 136, column: 5, scope: !52)
!66 = !DILocation(line: 137, column: 5, scope: !52)
!67 = !DILocation(line: 138, column: 5, scope: !52)
!68 = !DILocation(line: 141, column: 5, scope: !52)
!69 = !DILocation(line: 142, column: 5, scope: !52)
!70 = !DILocation(line: 143, column: 5, scope: !52)
!71 = !DILocation(line: 145, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !16, line: 62, type: !4)
!74 = !DILocation(line: 62, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !16, line: 63, type: !4)
!76 = !DILocation(line: 63, column: 15, scope: !72)
!77 = !DILocation(line: 63, column: 42, scope: !72)
!78 = !DILocation(line: 63, column: 31, scope: !72)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !16, line: 64, type: !4)
!80 = !DILocation(line: 64, column: 15, scope: !72)
!81 = !DILocation(line: 64, column: 43, scope: !72)
!82 = !DILocation(line: 64, column: 32, scope: !72)
!83 = !DILocation(line: 74, column: 16, scope: !72)
!84 = !DILocation(line: 74, column: 14, scope: !72)
!85 = !DILocation(line: 75, column: 9, scope: !72)
!86 = !DILocation(line: 75, column: 17, scope: !72)
!87 = !DILocalVariable(name: "source", scope: !88, file: !16, line: 79, type: !35)
!88 = distinct !DILexicalBlock(scope: !72, file: !16, line: 78, column: 5)
!89 = !DILocation(line: 79, column: 17, scope: !88)
!90 = !DILocation(line: 82, column: 17, scope: !88)
!91 = !DILocation(line: 82, column: 9, scope: !88)
!92 = !DILocation(line: 82, column: 39, scope: !88)
!93 = !DILocation(line: 82, column: 32, scope: !88)
!94 = !DILocation(line: 82, column: 47, scope: !88)
!95 = !DILocation(line: 82, column: 52, scope: !88)
!96 = !DILocation(line: 83, column: 20, scope: !88)
!97 = !DILocation(line: 83, column: 9, scope: !88)
!98 = !DILocation(line: 85, column: 1, scope: !72)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 88, type: !17, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !16, line: 90, type: !4)
!101 = !DILocation(line: 90, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !16, line: 91, type: !4)
!103 = !DILocation(line: 91, column: 15, scope: !99)
!104 = !DILocation(line: 91, column: 42, scope: !99)
!105 = !DILocation(line: 91, column: 31, scope: !99)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !16, line: 92, type: !4)
!107 = !DILocation(line: 92, column: 15, scope: !99)
!108 = !DILocation(line: 92, column: 43, scope: !99)
!109 = !DILocation(line: 92, column: 32, scope: !99)
!110 = !DILocation(line: 98, column: 16, scope: !99)
!111 = !DILocation(line: 98, column: 14, scope: !99)
!112 = !DILocation(line: 99, column: 9, scope: !99)
!113 = !DILocation(line: 99, column: 17, scope: !99)
!114 = !DILocalVariable(name: "source", scope: !115, file: !16, line: 107, type: !35)
!115 = distinct !DILexicalBlock(scope: !99, file: !16, line: 106, column: 5)
!116 = !DILocation(line: 107, column: 17, scope: !115)
!117 = !DILocation(line: 110, column: 17, scope: !115)
!118 = !DILocation(line: 110, column: 9, scope: !115)
!119 = !DILocation(line: 110, column: 39, scope: !115)
!120 = !DILocation(line: 110, column: 32, scope: !115)
!121 = !DILocation(line: 110, column: 47, scope: !115)
!122 = !DILocation(line: 110, column: 52, scope: !115)
!123 = !DILocation(line: 111, column: 20, scope: !115)
!124 = !DILocation(line: 111, column: 9, scope: !115)
!125 = !DILocation(line: 113, column: 1, scope: !99)
