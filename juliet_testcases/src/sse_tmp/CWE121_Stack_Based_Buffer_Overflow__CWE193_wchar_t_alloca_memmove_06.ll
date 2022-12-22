; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06_bad() #0 !dbg !15 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06_bad.source to i8*), i64 44, i1 false), !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %8 = bitcast i32* %7 to i8*, !dbg !42
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %9 = bitcast i32* %arraydecay to i8*, !dbg !42
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !43
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !44
  %add = add i64 %call, 1, !dbg !45
  %mul = mul i64 %add, 4, !dbg !46
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !42
  %10 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %10), !dbg !48
  ret void, !dbg !49
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 40, align 16, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %2 = alloca i8, i64 44, align 16, !dbg !83
  %3 = bitcast i8* %2 to i32*, !dbg !84
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !82
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !85
  store i32* %4, i32** %data, align 8, !dbg !88
  %5 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !93
  %7 = load i32*, i32** %data, align 8, !dbg !94
  %8 = bitcast i32* %7 to i8*, !dbg !95
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !95
  %9 = bitcast i32* %arraydecay to i8*, !dbg !95
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !96
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !97
  %add = add i64 %call, 1, !dbg !98
  %mul = mul i64 %add, 4, !dbg !99
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !95
  %10 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %10), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 40, align 16, !dbg !108
  %1 = bitcast i8* %0 to i32*, !dbg !109
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %2 = alloca i8, i64 44, align 16, !dbg !112
  %3 = bitcast i8* %2 to i32*, !dbg !113
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !111
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  store i32* %4, i32** %data, align 8, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !122
  %7 = load i32*, i32** %data, align 8, !dbg !123
  %8 = bitcast i32* %7 to i8*, !dbg !124
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !124
  %9 = bitcast i32* %arraydecay to i8*, !dbg !124
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !125
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !126
  %add = add i64 %call, 1, !dbg !127
  %mul = mul i64 %add, 4, !dbg !128
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !124
  %10 = load i32*, i32** %data, align 8, !dbg !129
  call void @printWLine(i32* %10), !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06_bad", scope: !16, file: !16, line: 32, type: !17, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 34, type: !4)
!20 = !DILocation(line: 34, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 35, type: !4)
!22 = !DILocation(line: 35, column: 15, scope: !15)
!23 = !DILocation(line: 35, column: 42, scope: !15)
!24 = !DILocation(line: 35, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 36, type: !4)
!26 = !DILocation(line: 36, column: 15, scope: !15)
!27 = !DILocation(line: 36, column: 43, scope: !15)
!28 = !DILocation(line: 36, column: 32, scope: !15)
!29 = !DILocation(line: 41, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 38, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 8)
!32 = !DILocation(line: 41, column: 14, scope: !30)
!33 = !DILocation(line: 42, column: 9, scope: !30)
!34 = !DILocation(line: 42, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !16, line: 45, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 44, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 45, column: 17, scope: !36)
!41 = !DILocation(line: 48, column: 17, scope: !36)
!42 = !DILocation(line: 48, column: 9, scope: !36)
!43 = !DILocation(line: 48, column: 39, scope: !36)
!44 = !DILocation(line: 48, column: 32, scope: !36)
!45 = !DILocation(line: 48, column: 47, scope: !36)
!46 = !DILocation(line: 48, column: 52, scope: !36)
!47 = !DILocation(line: 49, column: 20, scope: !36)
!48 = !DILocation(line: 49, column: 9, scope: !36)
!49 = !DILocation(line: 51, column: 1, scope: !15)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_06_good", scope: !16, file: !16, line: 106, type: !17, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 108, column: 5, scope: !50)
!52 = !DILocation(line: 109, column: 5, scope: !50)
!53 = !DILocation(line: 110, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 122, type: !55, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !16, line: 122, type: !7)
!61 = !DILocation(line: 122, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !16, line: 122, type: !57)
!63 = !DILocation(line: 122, column: 27, scope: !54)
!64 = !DILocation(line: 125, column: 22, scope: !54)
!65 = !DILocation(line: 125, column: 12, scope: !54)
!66 = !DILocation(line: 125, column: 5, scope: !54)
!67 = !DILocation(line: 127, column: 5, scope: !54)
!68 = !DILocation(line: 128, column: 5, scope: !54)
!69 = !DILocation(line: 129, column: 5, scope: !54)
!70 = !DILocation(line: 132, column: 5, scope: !54)
!71 = !DILocation(line: 133, column: 5, scope: !54)
!72 = !DILocation(line: 134, column: 5, scope: !54)
!73 = !DILocation(line: 136, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 58, type: !17, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !16, line: 60, type: !4)
!76 = !DILocation(line: 60, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !16, line: 61, type: !4)
!78 = !DILocation(line: 61, column: 15, scope: !74)
!79 = !DILocation(line: 61, column: 42, scope: !74)
!80 = !DILocation(line: 61, column: 31, scope: !74)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !16, line: 62, type: !4)
!82 = !DILocation(line: 62, column: 15, scope: !74)
!83 = !DILocation(line: 62, column: 43, scope: !74)
!84 = !DILocation(line: 62, column: 32, scope: !74)
!85 = !DILocation(line: 72, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !16, line: 69, column: 5)
!87 = distinct !DILexicalBlock(scope: !74, file: !16, line: 63, column: 8)
!88 = !DILocation(line: 72, column: 14, scope: !86)
!89 = !DILocation(line: 73, column: 9, scope: !86)
!90 = !DILocation(line: 73, column: 17, scope: !86)
!91 = !DILocalVariable(name: "source", scope: !92, file: !16, line: 76, type: !37)
!92 = distinct !DILexicalBlock(scope: !74, file: !16, line: 75, column: 5)
!93 = !DILocation(line: 76, column: 17, scope: !92)
!94 = !DILocation(line: 79, column: 17, scope: !92)
!95 = !DILocation(line: 79, column: 9, scope: !92)
!96 = !DILocation(line: 79, column: 39, scope: !92)
!97 = !DILocation(line: 79, column: 32, scope: !92)
!98 = !DILocation(line: 79, column: 47, scope: !92)
!99 = !DILocation(line: 79, column: 52, scope: !92)
!100 = !DILocation(line: 80, column: 20, scope: !92)
!101 = !DILocation(line: 80, column: 9, scope: !92)
!102 = !DILocation(line: 82, column: 1, scope: !74)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 85, type: !17, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !16, line: 87, type: !4)
!105 = !DILocation(line: 87, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !16, line: 88, type: !4)
!107 = !DILocation(line: 88, column: 15, scope: !103)
!108 = !DILocation(line: 88, column: 42, scope: !103)
!109 = !DILocation(line: 88, column: 31, scope: !103)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !16, line: 89, type: !4)
!111 = !DILocation(line: 89, column: 15, scope: !103)
!112 = !DILocation(line: 89, column: 43, scope: !103)
!113 = !DILocation(line: 89, column: 32, scope: !103)
!114 = !DILocation(line: 94, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !16, line: 91, column: 5)
!116 = distinct !DILexicalBlock(scope: !103, file: !16, line: 90, column: 8)
!117 = !DILocation(line: 94, column: 14, scope: !115)
!118 = !DILocation(line: 95, column: 9, scope: !115)
!119 = !DILocation(line: 95, column: 17, scope: !115)
!120 = !DILocalVariable(name: "source", scope: !121, file: !16, line: 98, type: !37)
!121 = distinct !DILexicalBlock(scope: !103, file: !16, line: 97, column: 5)
!122 = !DILocation(line: 98, column: 17, scope: !121)
!123 = !DILocation(line: 101, column: 17, scope: !121)
!124 = !DILocation(line: 101, column: 9, scope: !121)
!125 = !DILocation(line: 101, column: 39, scope: !121)
!126 = !DILocation(line: 101, column: 32, scope: !121)
!127 = !DILocation(line: 101, column: 47, scope: !121)
!128 = !DILocation(line: 101, column: 52, scope: !121)
!129 = !DILocation(line: 102, column: 20, scope: !121)
!130 = !DILocation(line: 102, column: 9, scope: !121)
!131 = !DILocation(line: 104, column: 1, scope: !103)
