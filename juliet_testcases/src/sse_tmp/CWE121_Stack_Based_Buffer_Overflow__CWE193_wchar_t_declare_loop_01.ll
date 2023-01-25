; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01_bad.source to i8*), i64 44, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !45
  store i64 %call, i64* %sourceLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !50
  %3 = load i64, i64* %sourceLen, align 8, !dbg !52
  %add = add i64 %3, 1, !dbg !53
  %cmp = icmp ult i64 %2, %add, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !58
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !59
  store i32 %5, i32* %arrayidx3, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %8, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !68
  call void @printWLine(i32* %9), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i32* %arraydecay, i32** %data, align 8, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !112
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !113
  store i64 %call, i64* %sourceLen, align 8, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !118
  %3 = load i64, i64* %sourceLen, align 8, !dbg !120
  %add = add i64 %3, 1, !dbg !121
  %cmp = icmp ult i64 %2, %add, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !126
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !126
  %6 = load i32*, i32** %data, align 8, !dbg !127
  %7 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !127
  store i32 %5, i32* %arrayidx3, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %8, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !135
  call void @printWLine(i32* %9), !dbg !136
  ret void, !dbg !137
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 35, column: 12, scope: !11)
!32 = !DILocation(line: 35, column: 10, scope: !11)
!33 = !DILocation(line: 36, column: 5, scope: !11)
!34 = !DILocation(line: 36, column: 13, scope: !11)
!35 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 38, type: !27)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!37 = !DILocation(line: 38, column: 17, scope: !36)
!38 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 39, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 39, column: 16, scope: !36)
!42 = !DILocalVariable(name: "sourceLen", scope: !36, file: !12, line: 39, type: !39)
!43 = !DILocation(line: 39, column: 19, scope: !36)
!44 = !DILocation(line: 40, column: 28, scope: !36)
!45 = !DILocation(line: 40, column: 21, scope: !36)
!46 = !DILocation(line: 40, column: 19, scope: !36)
!47 = !DILocation(line: 43, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !36, file: !12, line: 43, column: 9)
!49 = !DILocation(line: 43, column: 14, scope: !48)
!50 = !DILocation(line: 43, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 43, column: 9)
!52 = !DILocation(line: 43, column: 25, scope: !51)
!53 = !DILocation(line: 43, column: 35, scope: !51)
!54 = !DILocation(line: 43, column: 23, scope: !51)
!55 = !DILocation(line: 43, column: 9, scope: !48)
!56 = !DILocation(line: 45, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !12, line: 44, column: 9)
!58 = !DILocation(line: 45, column: 23, scope: !57)
!59 = !DILocation(line: 45, column: 13, scope: !57)
!60 = !DILocation(line: 45, column: 18, scope: !57)
!61 = !DILocation(line: 45, column: 21, scope: !57)
!62 = !DILocation(line: 46, column: 9, scope: !57)
!63 = !DILocation(line: 43, column: 41, scope: !51)
!64 = !DILocation(line: 43, column: 9, scope: !51)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 46, column: 9, scope: !48)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 47, column: 20, scope: !36)
!69 = !DILocation(line: 47, column: 9, scope: !36)
!70 = !DILocation(line: 49, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_01_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 81, column: 5, scope: !71)
!73 = !DILocation(line: 82, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !75, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!19, !19, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 94, type: !19)
!81 = !DILocation(line: 94, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 94, type: !77)
!83 = !DILocation(line: 94, column: 27, scope: !74)
!84 = !DILocation(line: 97, column: 22, scope: !74)
!85 = !DILocation(line: 97, column: 12, scope: !74)
!86 = !DILocation(line: 97, column: 5, scope: !74)
!87 = !DILocation(line: 99, column: 5, scope: !74)
!88 = !DILocation(line: 100, column: 5, scope: !74)
!89 = !DILocation(line: 101, column: 5, scope: !74)
!90 = !DILocation(line: 104, column: 5, scope: !74)
!91 = !DILocation(line: 105, column: 5, scope: !74)
!92 = !DILocation(line: 106, column: 5, scope: !74)
!93 = !DILocation(line: 108, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 58, type: !16)
!96 = !DILocation(line: 58, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !12, line: 59, type: !22)
!98 = !DILocation(line: 59, column: 13, scope: !94)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !12, line: 60, type: !27)
!100 = !DILocation(line: 60, column: 13, scope: !94)
!101 = !DILocation(line: 63, column: 12, scope: !94)
!102 = !DILocation(line: 63, column: 10, scope: !94)
!103 = !DILocation(line: 64, column: 5, scope: !94)
!104 = !DILocation(line: 64, column: 13, scope: !94)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 66, type: !27)
!106 = distinct !DILexicalBlock(scope: !94, file: !12, line: 65, column: 5)
!107 = !DILocation(line: 66, column: 17, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !106, file: !12, line: 67, type: !39)
!109 = !DILocation(line: 67, column: 16, scope: !106)
!110 = !DILocalVariable(name: "sourceLen", scope: !106, file: !12, line: 67, type: !39)
!111 = !DILocation(line: 67, column: 19, scope: !106)
!112 = !DILocation(line: 68, column: 28, scope: !106)
!113 = !DILocation(line: 68, column: 21, scope: !106)
!114 = !DILocation(line: 68, column: 19, scope: !106)
!115 = !DILocation(line: 71, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !12, line: 71, column: 9)
!117 = !DILocation(line: 71, column: 14, scope: !116)
!118 = !DILocation(line: 71, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 71, column: 9)
!120 = !DILocation(line: 71, column: 25, scope: !119)
!121 = !DILocation(line: 71, column: 35, scope: !119)
!122 = !DILocation(line: 71, column: 23, scope: !119)
!123 = !DILocation(line: 71, column: 9, scope: !116)
!124 = !DILocation(line: 73, column: 30, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !12, line: 72, column: 9)
!126 = !DILocation(line: 73, column: 23, scope: !125)
!127 = !DILocation(line: 73, column: 13, scope: !125)
!128 = !DILocation(line: 73, column: 18, scope: !125)
!129 = !DILocation(line: 73, column: 21, scope: !125)
!130 = !DILocation(line: 74, column: 9, scope: !125)
!131 = !DILocation(line: 71, column: 41, scope: !119)
!132 = !DILocation(line: 71, column: 9, scope: !119)
!133 = distinct !{!133, !123, !134, !67}
!134 = !DILocation(line: 74, column: 9, scope: !116)
!135 = !DILocation(line: 75, column: 20, scope: !106)
!136 = !DILocation(line: 75, column: 9, scope: !106)
!137 = !DILocation(line: 77, column: 1, scope: !94)
