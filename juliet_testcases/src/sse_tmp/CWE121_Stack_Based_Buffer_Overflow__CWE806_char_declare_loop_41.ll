; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_badSink(i8* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = load i8*, i8** %data.addr, align 8, !dbg !32
  %call = call i64 @strlen(i8* %1) #6, !dbg !33
  store i64 %call, i64* %dataLen, align 8, !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !38
  %3 = load i64, i64* %dataLen, align 8, !dbg !40
  %cmp = icmp ult i64 %2, %3, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !43
  %5 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !43
  %6 = load i8, i8* %arrayidx, align 1, !dbg !43
  %7 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !47
  store i8 %6, i8* %arrayidx1, align 1, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %8, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !55
  store i8 0, i8* %arrayidx2, align 1, !dbg !56
  %9 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @printLine(i8* %9), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_bad() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !65, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !70
  store i8* %arraydecay, i8** %data, align 8, !dbg !71
  %0 = load i8*, i8** %data, align 8, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !73
  %1 = load i8*, i8** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %2 = load i8*, i8** %data, align 8, !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_badSink(i8* %2), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_goodG2BSink(i8* %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !87, metadata !DIExpression()), !dbg !88
  %1 = load i8*, i8** %data.addr, align 8, !dbg !89
  %call = call i64 @strlen(i8* %1) #6, !dbg !90
  store i64 %call, i64* %dataLen, align 8, !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !95
  %3 = load i64, i64* %dataLen, align 8, !dbg !97
  %cmp = icmp ult i64 %2, %3, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !100
  %5 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !100
  %6 = load i8, i8* %arrayidx, align 1, !dbg !100
  %7 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !104
  store i8 %6, i8* %arrayidx1, align 1, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %8, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !111
  store i8 0, i8* %arrayidx2, align 1, !dbg !112
  %9 = load i8*, i8** %data.addr, align 8, !dbg !113
  call void @printLine(i8* %9), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_good() #0 !dbg !116 {
entry:
  call void @goodG2B(), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !119 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !124, metadata !DIExpression()), !dbg !125
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !126, metadata !DIExpression()), !dbg !127
  %call = call i64 @time(i64* null) #7, !dbg !128
  %conv = trunc i64 %call to i32, !dbg !129
  call void @srand(i32 %conv) #7, !dbg !130
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !131
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_good(), !dbg !132
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !133
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !134
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_bad(), !dbg !135
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !136
  ret i32 0, !dbg !137
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !138 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !143
  store i8* %arraydecay, i8** %data, align 8, !dbg !144
  %0 = load i8*, i8** %data, align 8, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !146
  %1 = load i8*, i8** %data, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !147
  store i8 0, i8* %arrayidx, align 1, !dbg !148
  %2 = load i8*, i8** %data, align 8, !dbg !149
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_goodG2BSink(i8* %2), !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!18 = !DILocation(line: 23, column: 85, scope: !11)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocalVariable(name: "i", scope: !20, file: !12, line: 27, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 27, column: 16, scope: !20)
!30 = !DILocalVariable(name: "dataLen", scope: !20, file: !12, line: 27, type: !26)
!31 = !DILocation(line: 27, column: 19, scope: !20)
!32 = !DILocation(line: 28, column: 26, scope: !20)
!33 = !DILocation(line: 28, column: 19, scope: !20)
!34 = !DILocation(line: 28, column: 17, scope: !20)
!35 = !DILocation(line: 30, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !20, file: !12, line: 30, column: 9)
!37 = !DILocation(line: 30, column: 14, scope: !36)
!38 = !DILocation(line: 30, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 30, column: 9)
!40 = !DILocation(line: 30, column: 25, scope: !39)
!41 = !DILocation(line: 30, column: 23, scope: !39)
!42 = !DILocation(line: 30, column: 9, scope: !36)
!43 = !DILocation(line: 32, column: 23, scope: !44)
!44 = distinct !DILexicalBlock(scope: !39, file: !12, line: 31, column: 9)
!45 = !DILocation(line: 32, column: 28, scope: !44)
!46 = !DILocation(line: 32, column: 18, scope: !44)
!47 = !DILocation(line: 32, column: 13, scope: !44)
!48 = !DILocation(line: 32, column: 21, scope: !44)
!49 = !DILocation(line: 33, column: 9, scope: !44)
!50 = !DILocation(line: 30, column: 35, scope: !39)
!51 = !DILocation(line: 30, column: 9, scope: !39)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 33, column: 9, scope: !36)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 34, column: 9, scope: !20)
!56 = !DILocation(line: 34, column: 20, scope: !20)
!57 = !DILocation(line: 35, column: 19, scope: !20)
!58 = !DILocation(line: 35, column: 9, scope: !20)
!59 = !DILocation(line: 37, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_bad", scope: !12, file: !12, line: 39, type: !61, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{null}
!63 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 41, type: !15)
!64 = !DILocation(line: 41, column: 12, scope: !60)
!65 = !DILocalVariable(name: "dataBuffer", scope: !60, file: !12, line: 42, type: !66)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 100)
!69 = !DILocation(line: 42, column: 10, scope: !60)
!70 = !DILocation(line: 43, column: 12, scope: !60)
!71 = !DILocation(line: 43, column: 10, scope: !60)
!72 = !DILocation(line: 45, column: 12, scope: !60)
!73 = !DILocation(line: 45, column: 5, scope: !60)
!74 = !DILocation(line: 46, column: 5, scope: !60)
!75 = !DILocation(line: 46, column: 17, scope: !60)
!76 = !DILocation(line: 47, column: 77, scope: !60)
!77 = !DILocation(line: 47, column: 5, scope: !60)
!78 = !DILocation(line: 48, column: 1, scope: !60)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !12, line: 54, type: !15)
!81 = !DILocation(line: 54, column: 89, scope: !79)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !12, line: 57, type: !21)
!83 = distinct !DILexicalBlock(scope: !79, file: !12, line: 56, column: 5)
!84 = !DILocation(line: 57, column: 14, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !83, file: !12, line: 58, type: !26)
!86 = !DILocation(line: 58, column: 16, scope: !83)
!87 = !DILocalVariable(name: "dataLen", scope: !83, file: !12, line: 58, type: !26)
!88 = !DILocation(line: 58, column: 19, scope: !83)
!89 = !DILocation(line: 59, column: 26, scope: !83)
!90 = !DILocation(line: 59, column: 19, scope: !83)
!91 = !DILocation(line: 59, column: 17, scope: !83)
!92 = !DILocation(line: 61, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !12, line: 61, column: 9)
!94 = !DILocation(line: 61, column: 14, scope: !93)
!95 = !DILocation(line: 61, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 61, column: 9)
!97 = !DILocation(line: 61, column: 25, scope: !96)
!98 = !DILocation(line: 61, column: 23, scope: !96)
!99 = !DILocation(line: 61, column: 9, scope: !93)
!100 = !DILocation(line: 63, column: 23, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !12, line: 62, column: 9)
!102 = !DILocation(line: 63, column: 28, scope: !101)
!103 = !DILocation(line: 63, column: 18, scope: !101)
!104 = !DILocation(line: 63, column: 13, scope: !101)
!105 = !DILocation(line: 63, column: 21, scope: !101)
!106 = !DILocation(line: 64, column: 9, scope: !101)
!107 = !DILocation(line: 61, column: 35, scope: !96)
!108 = !DILocation(line: 61, column: 9, scope: !96)
!109 = distinct !{!109, !99, !110, !54}
!110 = !DILocation(line: 64, column: 9, scope: !93)
!111 = !DILocation(line: 65, column: 9, scope: !83)
!112 = !DILocation(line: 65, column: 20, scope: !83)
!113 = !DILocation(line: 66, column: 19, scope: !83)
!114 = !DILocation(line: 66, column: 9, scope: !83)
!115 = !DILocation(line: 68, column: 1, scope: !79)
!116 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_41_good", scope: !12, file: !12, line: 82, type: !61, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocation(line: 84, column: 5, scope: !116)
!118 = !DILocation(line: 85, column: 1, scope: !116)
!119 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !120, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{!122, !122, !123}
!122 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!124 = !DILocalVariable(name: "argc", arg: 1, scope: !119, file: !12, line: 97, type: !122)
!125 = !DILocation(line: 97, column: 14, scope: !119)
!126 = !DILocalVariable(name: "argv", arg: 2, scope: !119, file: !12, line: 97, type: !123)
!127 = !DILocation(line: 97, column: 27, scope: !119)
!128 = !DILocation(line: 100, column: 22, scope: !119)
!129 = !DILocation(line: 100, column: 12, scope: !119)
!130 = !DILocation(line: 100, column: 5, scope: !119)
!131 = !DILocation(line: 102, column: 5, scope: !119)
!132 = !DILocation(line: 103, column: 5, scope: !119)
!133 = !DILocation(line: 104, column: 5, scope: !119)
!134 = !DILocation(line: 107, column: 5, scope: !119)
!135 = !DILocation(line: 108, column: 5, scope: !119)
!136 = !DILocation(line: 109, column: 5, scope: !119)
!137 = !DILocation(line: 111, column: 5, scope: !119)
!138 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 71, type: !61, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocalVariable(name: "data", scope: !138, file: !12, line: 73, type: !15)
!140 = !DILocation(line: 73, column: 12, scope: !138)
!141 = !DILocalVariable(name: "dataBuffer", scope: !138, file: !12, line: 74, type: !66)
!142 = !DILocation(line: 74, column: 10, scope: !138)
!143 = !DILocation(line: 75, column: 12, scope: !138)
!144 = !DILocation(line: 75, column: 10, scope: !138)
!145 = !DILocation(line: 77, column: 12, scope: !138)
!146 = !DILocation(line: 77, column: 5, scope: !138)
!147 = !DILocation(line: 78, column: 5, scope: !138)
!148 = !DILocation(line: 78, column: 16, scope: !138)
!149 = !DILocation(line: 79, column: 81, scope: !138)
!150 = !DILocation(line: 79, column: 5, scope: !138)
!151 = !DILocation(line: 80, column: 1, scope: !138)
