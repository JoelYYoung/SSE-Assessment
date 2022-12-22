; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink(i8* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !30, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !32
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !33
  store i64 %call, i64* %sourceLen, align 8, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !38
  %2 = load i64, i64* %sourceLen, align 8, !dbg !40
  %add = add i64 %2, 1, !dbg !41
  %cmp = icmp ult i64 %1, %add, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !46
  %4 = load i8, i8* %arrayidx, align 1, !dbg !46
  %5 = load i8*, i8** %data.addr, align 8, !dbg !47
  %6 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !47
  store i8 %4, i8* %arrayidx1, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %7, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !56
  call void @printLine(i8* %8), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_bad() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !64, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !71
  store i8* %arraydecay, i8** %data, align 8, !dbg !72
  %0 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  %1 = load i8*, i8** %data, align 8, !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink(i8* %1), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink(i8* %data) #0 !dbg !78 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !83
  call void @llvm.dbg.declare(metadata i64* %i, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !88
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !89
  store i64 %call, i64* %sourceLen, align 8, !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !94
  %2 = load i64, i64* %sourceLen, align 8, !dbg !96
  %add = add i64 %2, 1, !dbg !97
  %cmp = icmp ult i64 %1, %add, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !102
  %4 = load i8, i8* %arrayidx, align 1, !dbg !102
  %5 = load i8*, i8** %data.addr, align 8, !dbg !103
  %6 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !103
  store i8 %4, i8* %arrayidx1, align 1, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %7, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !111
  call void @printLine(i8* %8), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_good() #0 !dbg !114 {
entry:
  call void @goodG2B(), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !117 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !122, metadata !DIExpression()), !dbg !123
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !124, metadata !DIExpression()), !dbg !125
  %call = call i64 @time(i64* null) #7, !dbg !126
  %conv = trunc i64 %call to i32, !dbg !127
  call void @srand(i32 %conv) #7, !dbg !128
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !129
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_good(), !dbg !130
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !132
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_bad(), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !134
  ret i32 0, !dbg !135
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !136 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !143
  store i8* %arraydecay, i8** %data, align 8, !dbg !144
  %0 = load i8*, i8** %data, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !145
  store i8 0, i8* %arrayidx, align 1, !dbg !146
  %1 = load i8*, i8** %data, align 8, !dbg !147
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink(i8* %1), !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 28, type: !15)
!18 = !DILocation(line: 28, column: 85, scope: !11)
!19 = !DILocalVariable(name: "source", scope: !20, file: !12, line: 31, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 88, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 11)
!24 = !DILocation(line: 31, column: 14, scope: !20)
!25 = !DILocalVariable(name: "i", scope: !20, file: !12, line: 32, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 32, column: 16, scope: !20)
!30 = !DILocalVariable(name: "sourceLen", scope: !20, file: !12, line: 32, type: !26)
!31 = !DILocation(line: 32, column: 19, scope: !20)
!32 = !DILocation(line: 33, column: 28, scope: !20)
!33 = !DILocation(line: 33, column: 21, scope: !20)
!34 = !DILocation(line: 33, column: 19, scope: !20)
!35 = !DILocation(line: 36, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !20, file: !12, line: 36, column: 9)
!37 = !DILocation(line: 36, column: 14, scope: !36)
!38 = !DILocation(line: 36, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 36, column: 9)
!40 = !DILocation(line: 36, column: 25, scope: !39)
!41 = !DILocation(line: 36, column: 35, scope: !39)
!42 = !DILocation(line: 36, column: 23, scope: !39)
!43 = !DILocation(line: 36, column: 9, scope: !36)
!44 = !DILocation(line: 38, column: 30, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !12, line: 37, column: 9)
!46 = !DILocation(line: 38, column: 23, scope: !45)
!47 = !DILocation(line: 38, column: 13, scope: !45)
!48 = !DILocation(line: 38, column: 18, scope: !45)
!49 = !DILocation(line: 38, column: 21, scope: !45)
!50 = !DILocation(line: 39, column: 9, scope: !45)
!51 = !DILocation(line: 36, column: 41, scope: !39)
!52 = !DILocation(line: 36, column: 9, scope: !39)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 39, column: 9, scope: !36)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 40, column: 19, scope: !20)
!57 = !DILocation(line: 40, column: 9, scope: !20)
!58 = !DILocation(line: 42, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_bad", scope: !12, file: !12, line: 44, type: !60, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{null}
!62 = !DILocalVariable(name: "data", scope: !59, file: !12, line: 46, type: !15)
!63 = !DILocation(line: 46, column: 12, scope: !59)
!64 = !DILocalVariable(name: "dataBadBuffer", scope: !59, file: !12, line: 47, type: !65)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 10)
!68 = !DILocation(line: 47, column: 10, scope: !59)
!69 = !DILocalVariable(name: "dataGoodBuffer", scope: !59, file: !12, line: 48, type: !21)
!70 = !DILocation(line: 48, column: 10, scope: !59)
!71 = !DILocation(line: 51, column: 12, scope: !59)
!72 = !DILocation(line: 51, column: 10, scope: !59)
!73 = !DILocation(line: 52, column: 5, scope: !59)
!74 = !DILocation(line: 52, column: 13, scope: !59)
!75 = !DILocation(line: 53, column: 77, scope: !59)
!76 = !DILocation(line: 53, column: 5, scope: !59)
!77 = !DILocation(line: 54, column: 1, scope: !59)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", arg: 1, scope: !78, file: !12, line: 60, type: !15)
!80 = !DILocation(line: 60, column: 89, scope: !78)
!81 = !DILocalVariable(name: "source", scope: !82, file: !12, line: 63, type: !21)
!82 = distinct !DILexicalBlock(scope: !78, file: !12, line: 62, column: 5)
!83 = !DILocation(line: 63, column: 14, scope: !82)
!84 = !DILocalVariable(name: "i", scope: !82, file: !12, line: 64, type: !26)
!85 = !DILocation(line: 64, column: 16, scope: !82)
!86 = !DILocalVariable(name: "sourceLen", scope: !82, file: !12, line: 64, type: !26)
!87 = !DILocation(line: 64, column: 19, scope: !82)
!88 = !DILocation(line: 65, column: 28, scope: !82)
!89 = !DILocation(line: 65, column: 21, scope: !82)
!90 = !DILocation(line: 65, column: 19, scope: !82)
!91 = !DILocation(line: 68, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !82, file: !12, line: 68, column: 9)
!93 = !DILocation(line: 68, column: 14, scope: !92)
!94 = !DILocation(line: 68, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !12, line: 68, column: 9)
!96 = !DILocation(line: 68, column: 25, scope: !95)
!97 = !DILocation(line: 68, column: 35, scope: !95)
!98 = !DILocation(line: 68, column: 23, scope: !95)
!99 = !DILocation(line: 68, column: 9, scope: !92)
!100 = !DILocation(line: 70, column: 30, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !12, line: 69, column: 9)
!102 = !DILocation(line: 70, column: 23, scope: !101)
!103 = !DILocation(line: 70, column: 13, scope: !101)
!104 = !DILocation(line: 70, column: 18, scope: !101)
!105 = !DILocation(line: 70, column: 21, scope: !101)
!106 = !DILocation(line: 71, column: 9, scope: !101)
!107 = !DILocation(line: 68, column: 41, scope: !95)
!108 = !DILocation(line: 68, column: 9, scope: !95)
!109 = distinct !{!109, !99, !110, !55}
!110 = !DILocation(line: 71, column: 9, scope: !92)
!111 = !DILocation(line: 72, column: 19, scope: !82)
!112 = !DILocation(line: 72, column: 9, scope: !82)
!113 = !DILocation(line: 74, column: 1, scope: !78)
!114 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_good", scope: !12, file: !12, line: 89, type: !60, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocation(line: 91, column: 5, scope: !114)
!116 = !DILocation(line: 92, column: 1, scope: !114)
!117 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 104, type: !118, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DISubroutineType(types: !119)
!119 = !{!120, !120, !121}
!120 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!122 = !DILocalVariable(name: "argc", arg: 1, scope: !117, file: !12, line: 104, type: !120)
!123 = !DILocation(line: 104, column: 14, scope: !117)
!124 = !DILocalVariable(name: "argv", arg: 2, scope: !117, file: !12, line: 104, type: !121)
!125 = !DILocation(line: 104, column: 27, scope: !117)
!126 = !DILocation(line: 107, column: 22, scope: !117)
!127 = !DILocation(line: 107, column: 12, scope: !117)
!128 = !DILocation(line: 107, column: 5, scope: !117)
!129 = !DILocation(line: 109, column: 5, scope: !117)
!130 = !DILocation(line: 110, column: 5, scope: !117)
!131 = !DILocation(line: 111, column: 5, scope: !117)
!132 = !DILocation(line: 114, column: 5, scope: !117)
!133 = !DILocation(line: 115, column: 5, scope: !117)
!134 = !DILocation(line: 116, column: 5, scope: !117)
!135 = !DILocation(line: 118, column: 5, scope: !117)
!136 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 77, type: !60, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!137 = !DILocalVariable(name: "data", scope: !136, file: !12, line: 79, type: !15)
!138 = !DILocation(line: 79, column: 12, scope: !136)
!139 = !DILocalVariable(name: "dataBadBuffer", scope: !136, file: !12, line: 80, type: !65)
!140 = !DILocation(line: 80, column: 10, scope: !136)
!141 = !DILocalVariable(name: "dataGoodBuffer", scope: !136, file: !12, line: 81, type: !21)
!142 = !DILocation(line: 81, column: 10, scope: !136)
!143 = !DILocation(line: 84, column: 12, scope: !136)
!144 = !DILocation(line: 84, column: 10, scope: !136)
!145 = !DILocation(line: 85, column: 5, scope: !136)
!146 = !DILocation(line: 85, column: 13, scope: !136)
!147 = !DILocation(line: 86, column: 81, scope: !136)
!148 = !DILocation(line: 86, column: 5, scope: !136)
!149 = !DILocation(line: 87, column: 1, scope: !136)
