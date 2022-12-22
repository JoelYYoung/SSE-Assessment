; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  br label %while.body, !dbg !29

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %while.end, !dbg !35

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !47
  store i64 %call, i64* %sourceLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %while.end
  %2 = load i64, i64* %i, align 8, !dbg !52
  %3 = load i64, i64* %sourceLen, align 8, !dbg !54
  %add = add i64 %3, 1, !dbg !55
  %cmp = icmp ult i64 %2, %add, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !61
  store i8 %5, i8* %arrayidx3, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* %9), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  br label %while.body, !dbg !102

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  store i8* %arraydecay, i8** %data, align 8, !dbg !105
  %0 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  br label %while.end, !dbg !108

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !116
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !117
  store i64 %call, i64* %sourceLen, align 8, !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %while.end
  %2 = load i64, i64* %i, align 8, !dbg !122
  %3 = load i64, i64* %sourceLen, align 8, !dbg !124
  %add = add i64 %3, 1, !dbg !125
  %cmp = icmp ult i64 %2, %add, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !130
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !130
  %6 = load i8*, i8** %data, align 8, !dbg !131
  %7 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !131
  store i8 %5, i8* %arrayidx3, align 1, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %8, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %9), !dbg !140
  ret void, !dbg !141
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 33, column: 5, scope: !11)
!30 = !DILocation(line: 37, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!32 = !DILocation(line: 37, column: 14, scope: !31)
!33 = !DILocation(line: 38, column: 9, scope: !31)
!34 = !DILocation(line: 38, column: 17, scope: !31)
!35 = !DILocation(line: 39, column: 9, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 42, type: !25)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!38 = !DILocation(line: 42, column: 14, scope: !37)
!39 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 43, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 43, column: 16, scope: !37)
!44 = !DILocalVariable(name: "sourceLen", scope: !37, file: !12, line: 43, type: !40)
!45 = !DILocation(line: 43, column: 19, scope: !37)
!46 = !DILocation(line: 44, column: 28, scope: !37)
!47 = !DILocation(line: 44, column: 21, scope: !37)
!48 = !DILocation(line: 44, column: 19, scope: !37)
!49 = !DILocation(line: 47, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !37, file: !12, line: 47, column: 9)
!51 = !DILocation(line: 47, column: 14, scope: !50)
!52 = !DILocation(line: 47, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 47, column: 9)
!54 = !DILocation(line: 47, column: 25, scope: !53)
!55 = !DILocation(line: 47, column: 35, scope: !53)
!56 = !DILocation(line: 47, column: 23, scope: !53)
!57 = !DILocation(line: 47, column: 9, scope: !50)
!58 = !DILocation(line: 49, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !12, line: 48, column: 9)
!60 = !DILocation(line: 49, column: 23, scope: !59)
!61 = !DILocation(line: 49, column: 13, scope: !59)
!62 = !DILocation(line: 49, column: 18, scope: !59)
!63 = !DILocation(line: 49, column: 21, scope: !59)
!64 = !DILocation(line: 50, column: 9, scope: !59)
!65 = !DILocation(line: 47, column: 41, scope: !53)
!66 = !DILocation(line: 47, column: 9, scope: !53)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 50, column: 9, scope: !50)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 51, column: 19, scope: !37)
!71 = !DILocation(line: 51, column: 9, scope: !37)
!72 = !DILocation(line: 53, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_16_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 89, column: 5, scope: !73)
!75 = !DILocation(line: 90, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !77, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 102, type: !79)
!82 = !DILocation(line: 102, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 102, type: !80)
!84 = !DILocation(line: 102, column: 27, scope: !76)
!85 = !DILocation(line: 105, column: 22, scope: !76)
!86 = !DILocation(line: 105, column: 12, scope: !76)
!87 = !DILocation(line: 105, column: 5, scope: !76)
!88 = !DILocation(line: 107, column: 5, scope: !76)
!89 = !DILocation(line: 108, column: 5, scope: !76)
!90 = !DILocation(line: 109, column: 5, scope: !76)
!91 = !DILocation(line: 112, column: 5, scope: !76)
!92 = !DILocation(line: 113, column: 5, scope: !76)
!93 = !DILocation(line: 114, column: 5, scope: !76)
!94 = !DILocation(line: 116, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 62, type: !16)
!97 = !DILocation(line: 62, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 63, type: !20)
!99 = !DILocation(line: 63, column: 10, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 64, type: !25)
!101 = !DILocation(line: 64, column: 10, scope: !95)
!102 = !DILocation(line: 65, column: 5, scope: !95)
!103 = !DILocation(line: 69, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !95, file: !12, line: 66, column: 5)
!105 = !DILocation(line: 69, column: 14, scope: !104)
!106 = !DILocation(line: 70, column: 9, scope: !104)
!107 = !DILocation(line: 70, column: 17, scope: !104)
!108 = !DILocation(line: 71, column: 9, scope: !104)
!109 = !DILocalVariable(name: "source", scope: !110, file: !12, line: 74, type: !25)
!110 = distinct !DILexicalBlock(scope: !95, file: !12, line: 73, column: 5)
!111 = !DILocation(line: 74, column: 14, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !110, file: !12, line: 75, type: !40)
!113 = !DILocation(line: 75, column: 16, scope: !110)
!114 = !DILocalVariable(name: "sourceLen", scope: !110, file: !12, line: 75, type: !40)
!115 = !DILocation(line: 75, column: 19, scope: !110)
!116 = !DILocation(line: 76, column: 28, scope: !110)
!117 = !DILocation(line: 76, column: 21, scope: !110)
!118 = !DILocation(line: 76, column: 19, scope: !110)
!119 = !DILocation(line: 79, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !12, line: 79, column: 9)
!121 = !DILocation(line: 79, column: 14, scope: !120)
!122 = !DILocation(line: 79, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 79, column: 9)
!124 = !DILocation(line: 79, column: 25, scope: !123)
!125 = !DILocation(line: 79, column: 35, scope: !123)
!126 = !DILocation(line: 79, column: 23, scope: !123)
!127 = !DILocation(line: 79, column: 9, scope: !120)
!128 = !DILocation(line: 81, column: 30, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !12, line: 80, column: 9)
!130 = !DILocation(line: 81, column: 23, scope: !129)
!131 = !DILocation(line: 81, column: 13, scope: !129)
!132 = !DILocation(line: 81, column: 18, scope: !129)
!133 = !DILocation(line: 81, column: 21, scope: !129)
!134 = !DILocation(line: 82, column: 9, scope: !129)
!135 = !DILocation(line: 79, column: 41, scope: !123)
!136 = !DILocation(line: 79, column: 9, scope: !123)
!137 = distinct !{!137, !127, !138, !69}
!138 = !DILocation(line: 82, column: 9, scope: !120)
!139 = !DILocation(line: 83, column: 19, scope: !110)
!140 = !DILocation(line: 83, column: 9, scope: !110)
!141 = !DILocation(line: 85, column: 1, scope: !95)
