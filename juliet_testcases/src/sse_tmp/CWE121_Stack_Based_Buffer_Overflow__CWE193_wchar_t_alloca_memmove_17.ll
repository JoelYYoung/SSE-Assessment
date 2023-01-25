; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 40, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 44, align 16, !dbg !29
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %4, 1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  store i32* %5, i32** %data, align 8, !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %7, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17_bad.source to i8*), i64 44, i1 false), !dbg !54
  %9 = load i32*, i32** %data, align 8, !dbg !55
  %10 = bitcast i32* %9 to i8*, !dbg !56
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !56
  %11 = bitcast i32* %arraydecay to i8*, !dbg !56
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !57
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !58
  %add = add i64 %call, 1, !dbg !59
  %mul = mul i64 %add, 4, !dbg !60
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 %mul, i1 false), !dbg !56
  %12 = load i32*, i32** %data, align 8, !dbg !61
  call void @printWLine(i32* %12), !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 40, align 16, !dbg !94
  %1 = bitcast i8* %0 to i32*, !dbg !95
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %2 = alloca i8, i64 44, align 16, !dbg !98
  %3 = bitcast i8* %2 to i32*, !dbg !99
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !97
  store i32 0, i32* %h, align 4, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !103
  %cmp = icmp slt i32 %4, 1, !dbg !105
  br i1 %cmp, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !107
  store i32* %5, i32** %data, align 8, !dbg !109
  %6 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %h, align 4, !dbg !113
  %inc = add nsw i32 %7, 1, !dbg !113
  store i32 %inc, i32* %h, align 4, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !119
  %9 = load i32*, i32** %data, align 8, !dbg !120
  %10 = bitcast i32* %9 to i8*, !dbg !121
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !121
  %11 = bitcast i32* %arraydecay to i8*, !dbg !121
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !122
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !123
  %add = add i64 %call, 1, !dbg !124
  %mul = mul i64 %add, 4, !dbg !125
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 %mul, i1 false), !dbg !121
  %12 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* %12), !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 30, type: !7)
!20 = !DILocation(line: 30, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 32, type: !4)
!24 = !DILocation(line: 32, column: 15, scope: !15)
!25 = !DILocation(line: 32, column: 42, scope: !15)
!26 = !DILocation(line: 32, column: 31, scope: !15)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 33, type: !4)
!28 = !DILocation(line: 33, column: 15, scope: !15)
!29 = !DILocation(line: 33, column: 43, scope: !15)
!30 = !DILocation(line: 33, column: 32, scope: !15)
!31 = !DILocation(line: 34, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!33 = !DILocation(line: 34, column: 9, scope: !32)
!34 = !DILocation(line: 34, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !16, line: 34, column: 5)
!36 = !DILocation(line: 34, column: 18, scope: !35)
!37 = !DILocation(line: 34, column: 5, scope: !32)
!38 = !DILocation(line: 38, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !16, line: 35, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 9, scope: !39)
!42 = !DILocation(line: 39, column: 17, scope: !39)
!43 = !DILocation(line: 40, column: 5, scope: !39)
!44 = !DILocation(line: 34, column: 24, scope: !35)
!45 = !DILocation(line: 34, column: 5, scope: !35)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 40, column: 5, scope: !32)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "source", scope: !50, file: !16, line: 42, type: !51)
!50 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 11)
!54 = !DILocation(line: 42, column: 17, scope: !50)
!55 = !DILocation(line: 45, column: 17, scope: !50)
!56 = !DILocation(line: 45, column: 9, scope: !50)
!57 = !DILocation(line: 45, column: 39, scope: !50)
!58 = !DILocation(line: 45, column: 32, scope: !50)
!59 = !DILocation(line: 45, column: 47, scope: !50)
!60 = !DILocation(line: 45, column: 52, scope: !50)
!61 = !DILocation(line: 46, column: 20, scope: !50)
!62 = !DILocation(line: 46, column: 9, scope: !50)
!63 = !DILocation(line: 48, column: 1, scope: !15)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memmove_17_good", scope: !16, file: !16, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 79, column: 5, scope: !64)
!66 = !DILocation(line: 80, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 92, type: !68, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !16, line: 92, type: !7)
!74 = !DILocation(line: 92, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !16, line: 92, type: !70)
!76 = !DILocation(line: 92, column: 27, scope: !67)
!77 = !DILocation(line: 95, column: 22, scope: !67)
!78 = !DILocation(line: 95, column: 12, scope: !67)
!79 = !DILocation(line: 95, column: 5, scope: !67)
!80 = !DILocation(line: 97, column: 5, scope: !67)
!81 = !DILocation(line: 98, column: 5, scope: !67)
!82 = !DILocation(line: 99, column: 5, scope: !67)
!83 = !DILocation(line: 102, column: 5, scope: !67)
!84 = !DILocation(line: 103, column: 5, scope: !67)
!85 = !DILocation(line: 104, column: 5, scope: !67)
!86 = !DILocation(line: 106, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "h", scope: !87, file: !16, line: 57, type: !7)
!89 = !DILocation(line: 57, column: 9, scope: !87)
!90 = !DILocalVariable(name: "data", scope: !87, file: !16, line: 58, type: !4)
!91 = !DILocation(line: 58, column: 15, scope: !87)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !16, line: 59, type: !4)
!93 = !DILocation(line: 59, column: 15, scope: !87)
!94 = !DILocation(line: 59, column: 42, scope: !87)
!95 = !DILocation(line: 59, column: 31, scope: !87)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !16, line: 60, type: !4)
!97 = !DILocation(line: 60, column: 15, scope: !87)
!98 = !DILocation(line: 60, column: 43, scope: !87)
!99 = !DILocation(line: 60, column: 32, scope: !87)
!100 = !DILocation(line: 61, column: 11, scope: !101)
!101 = distinct !DILexicalBlock(scope: !87, file: !16, line: 61, column: 5)
!102 = !DILocation(line: 61, column: 9, scope: !101)
!103 = !DILocation(line: 61, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !16, line: 61, column: 5)
!105 = !DILocation(line: 61, column: 18, scope: !104)
!106 = !DILocation(line: 61, column: 5, scope: !101)
!107 = !DILocation(line: 65, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !16, line: 62, column: 5)
!109 = !DILocation(line: 65, column: 14, scope: !108)
!110 = !DILocation(line: 66, column: 9, scope: !108)
!111 = !DILocation(line: 66, column: 17, scope: !108)
!112 = !DILocation(line: 67, column: 5, scope: !108)
!113 = !DILocation(line: 61, column: 24, scope: !104)
!114 = !DILocation(line: 61, column: 5, scope: !104)
!115 = distinct !{!115, !106, !116, !48}
!116 = !DILocation(line: 67, column: 5, scope: !101)
!117 = !DILocalVariable(name: "source", scope: !118, file: !16, line: 69, type: !51)
!118 = distinct !DILexicalBlock(scope: !87, file: !16, line: 68, column: 5)
!119 = !DILocation(line: 69, column: 17, scope: !118)
!120 = !DILocation(line: 72, column: 17, scope: !118)
!121 = !DILocation(line: 72, column: 9, scope: !118)
!122 = !DILocation(line: 72, column: 39, scope: !118)
!123 = !DILocation(line: 72, column: 32, scope: !118)
!124 = !DILocation(line: 72, column: 47, scope: !118)
!125 = !DILocation(line: 72, column: 52, scope: !118)
!126 = !DILocation(line: 73, column: 20, scope: !118)
!127 = !DILocation(line: 73, column: 9, scope: !118)
!128 = !DILocation(line: 75, column: 1, scope: !87)
