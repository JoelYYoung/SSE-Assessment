; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %1, i8** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !39
  store i8* %2, i8** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !50
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !51
  store i64 %call, i64* %sourceLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !56
  %5 = load i64, i64* %sourceLen, align 8, !dbg !58
  %add = add i64 %5, 1, !dbg !59
  %cmp = icmp ult i64 %4, %add, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !64
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !64
  %8 = load i8*, i8** %data1, align 8, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !65
  store i8 %7, i8* %arrayidx4, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %10, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data1, align 8, !dbg !74
  call void @printLine(i8* %11), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #7, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #7, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  store i8* %arraydecay, i8** %data, align 8, !dbg !107
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = load i8*, i8** %data, align 8, !dbg !113
  store i8* %1, i8** %dataCopy, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !114, metadata !DIExpression()), !dbg !115
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !116
  store i8* %2, i8** %data1, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !124
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !125
  store i64 %call, i64* %sourceLen, align 8, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !130
  %5 = load i64, i64* %sourceLen, align 8, !dbg !132
  %add = add i64 %5, 1, !dbg !133
  %cmp = icmp ult i64 %4, %add, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !138
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !138
  %8 = load i8*, i8** %data1, align 8, !dbg !139
  %9 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !139
  store i8 %7, i8* %arrayidx4, align 1, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %10, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data1, align 8, !dbg !147
  call void @printLine(i8* %11), !dbg !148
  ret void, !dbg !149
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 30, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 31, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 35, column: 12, scope: !11)
!30 = !DILocation(line: 35, column: 10, scope: !11)
!31 = !DILocation(line: 36, column: 5, scope: !11)
!32 = !DILocation(line: 36, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !12, line: 38, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!35 = !DILocation(line: 38, column: 16, scope: !34)
!36 = !DILocation(line: 38, column: 27, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 39, type: !16)
!38 = !DILocation(line: 39, column: 16, scope: !34)
!39 = !DILocation(line: 39, column: 23, scope: !34)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 41, type: !25)
!41 = distinct !DILexicalBlock(scope: !34, file: !12, line: 40, column: 9)
!42 = !DILocation(line: 41, column: 18, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 42, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 42, column: 20, scope: !41)
!48 = !DILocalVariable(name: "sourceLen", scope: !41, file: !12, line: 42, type: !44)
!49 = !DILocation(line: 42, column: 23, scope: !41)
!50 = !DILocation(line: 43, column: 32, scope: !41)
!51 = !DILocation(line: 43, column: 25, scope: !41)
!52 = !DILocation(line: 43, column: 23, scope: !41)
!53 = !DILocation(line: 46, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !41, file: !12, line: 46, column: 13)
!55 = !DILocation(line: 46, column: 18, scope: !54)
!56 = !DILocation(line: 46, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 46, column: 13)
!58 = !DILocation(line: 46, column: 29, scope: !57)
!59 = !DILocation(line: 46, column: 39, scope: !57)
!60 = !DILocation(line: 46, column: 27, scope: !57)
!61 = !DILocation(line: 46, column: 13, scope: !54)
!62 = !DILocation(line: 48, column: 34, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !12, line: 47, column: 13)
!64 = !DILocation(line: 48, column: 27, scope: !63)
!65 = !DILocation(line: 48, column: 17, scope: !63)
!66 = !DILocation(line: 48, column: 22, scope: !63)
!67 = !DILocation(line: 48, column: 25, scope: !63)
!68 = !DILocation(line: 49, column: 13, scope: !63)
!69 = !DILocation(line: 46, column: 45, scope: !57)
!70 = !DILocation(line: 46, column: 13, scope: !57)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 49, column: 13, scope: !54)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 50, column: 23, scope: !41)
!75 = !DILocation(line: 50, column: 13, scope: !41)
!76 = !DILocation(line: 53, column: 1, scope: !11)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_31_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 89, column: 5, scope: !77)
!79 = !DILocation(line: 90, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !81, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 101, type: !83)
!86 = !DILocation(line: 101, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 101, type: !84)
!88 = !DILocation(line: 101, column: 27, scope: !80)
!89 = !DILocation(line: 104, column: 22, scope: !80)
!90 = !DILocation(line: 104, column: 12, scope: !80)
!91 = !DILocation(line: 104, column: 5, scope: !80)
!92 = !DILocation(line: 106, column: 5, scope: !80)
!93 = !DILocation(line: 107, column: 5, scope: !80)
!94 = !DILocation(line: 108, column: 5, scope: !80)
!95 = !DILocation(line: 111, column: 5, scope: !80)
!96 = !DILocation(line: 112, column: 5, scope: !80)
!97 = !DILocation(line: 113, column: 5, scope: !80)
!98 = !DILocation(line: 115, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 62, type: !16)
!101 = !DILocation(line: 62, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 63, type: !20)
!103 = !DILocation(line: 63, column: 10, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 64, type: !25)
!105 = !DILocation(line: 64, column: 10, scope: !99)
!106 = !DILocation(line: 67, column: 12, scope: !99)
!107 = !DILocation(line: 67, column: 10, scope: !99)
!108 = !DILocation(line: 68, column: 5, scope: !99)
!109 = !DILocation(line: 68, column: 13, scope: !99)
!110 = !DILocalVariable(name: "dataCopy", scope: !111, file: !12, line: 70, type: !16)
!111 = distinct !DILexicalBlock(scope: !99, file: !12, line: 69, column: 5)
!112 = !DILocation(line: 70, column: 16, scope: !111)
!113 = !DILocation(line: 70, column: 27, scope: !111)
!114 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 71, type: !16)
!115 = !DILocation(line: 71, column: 16, scope: !111)
!116 = !DILocation(line: 71, column: 23, scope: !111)
!117 = !DILocalVariable(name: "source", scope: !118, file: !12, line: 73, type: !25)
!118 = distinct !DILexicalBlock(scope: !111, file: !12, line: 72, column: 9)
!119 = !DILocation(line: 73, column: 18, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !118, file: !12, line: 74, type: !44)
!121 = !DILocation(line: 74, column: 20, scope: !118)
!122 = !DILocalVariable(name: "sourceLen", scope: !118, file: !12, line: 74, type: !44)
!123 = !DILocation(line: 74, column: 23, scope: !118)
!124 = !DILocation(line: 75, column: 32, scope: !118)
!125 = !DILocation(line: 75, column: 25, scope: !118)
!126 = !DILocation(line: 75, column: 23, scope: !118)
!127 = !DILocation(line: 78, column: 20, scope: !128)
!128 = distinct !DILexicalBlock(scope: !118, file: !12, line: 78, column: 13)
!129 = !DILocation(line: 78, column: 18, scope: !128)
!130 = !DILocation(line: 78, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 78, column: 13)
!132 = !DILocation(line: 78, column: 29, scope: !131)
!133 = !DILocation(line: 78, column: 39, scope: !131)
!134 = !DILocation(line: 78, column: 27, scope: !131)
!135 = !DILocation(line: 78, column: 13, scope: !128)
!136 = !DILocation(line: 80, column: 34, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !12, line: 79, column: 13)
!138 = !DILocation(line: 80, column: 27, scope: !137)
!139 = !DILocation(line: 80, column: 17, scope: !137)
!140 = !DILocation(line: 80, column: 22, scope: !137)
!141 = !DILocation(line: 80, column: 25, scope: !137)
!142 = !DILocation(line: 81, column: 13, scope: !137)
!143 = !DILocation(line: 78, column: 45, scope: !131)
!144 = !DILocation(line: 78, column: 13, scope: !131)
!145 = distinct !{!145, !135, !146, !73}
!146 = !DILocation(line: 81, column: 13, scope: !128)
!147 = !DILocation(line: 82, column: 23, scope: !118)
!148 = !DILocation(line: 82, column: 13, scope: !118)
!149 = !DILocation(line: 85, column: 1, scope: !99)
