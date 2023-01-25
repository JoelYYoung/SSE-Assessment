; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %2, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #6, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #6, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_badData, align 8, !dbg !64
  store i8* %0, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !65, metadata !DIExpression()), !dbg !70
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !70
  call void @llvm.dbg.declare(metadata i64* %i, metadata !71, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = load i8*, i8** %data, align 8, !dbg !78
  %call = call i64 @strlen(i8* %2) #7, !dbg !79
  store i64 %call, i64* %dataLen, align 8, !dbg !80
  store i64 0, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !84
  %4 = load i64, i64* %dataLen, align 8, !dbg !86
  %cmp = icmp ult i64 %3, %4, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !89
  %6 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !89
  %7 = load i8, i8* %arrayidx, align 1, !dbg !89
  %8 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !93
  store i8 %7, i8* %arrayidx1, align 1, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %9, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !101
  store i8 0, i8* %arrayidx2, align 1, !dbg !102
  %10 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %10), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i8* %arraydecay, i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !114
  %1 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %2 = load i8*, i8** %data, align 8, !dbg !117
  store i8* %2, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_goodG2BData, align 8, !dbg !118
  call void @goodG2BSink(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !121 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_goodG2BData, align 8, !dbg !124
  store i8* %0, i8** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !130, metadata !DIExpression()), !dbg !131
  %2 = load i8*, i8** %data, align 8, !dbg !132
  %call = call i64 @strlen(i8* %2) #7, !dbg !133
  store i64 %call, i64* %dataLen, align 8, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !138
  %4 = load i64, i64* %dataLen, align 8, !dbg !140
  %cmp = icmp ult i64 %3, %4, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !143
  %6 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !143
  %7 = load i8, i8* %arrayidx, align 1, !dbg !143
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %8, !dbg !147
  store i8 %7, i8* %arrayidx1, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %9, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !154
  store i8 0, i8* %arrayidx2, align 1, !dbg !155
  %10 = load i8*, i8** %data, align 8, !dbg !156
  call void @printLine(i8* %10), !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_bad", scope: !10, file: !10, line: 43, type: !20, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 45, type: !11)
!23 = !DILocation(line: 45, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !10, line: 46, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 46, column: 10, scope: !19)
!29 = !DILocation(line: 47, column: 12, scope: !19)
!30 = !DILocation(line: 47, column: 10, scope: !19)
!31 = !DILocation(line: 49, column: 12, scope: !19)
!32 = !DILocation(line: 49, column: 5, scope: !19)
!33 = !DILocation(line: 50, column: 5, scope: !19)
!34 = !DILocation(line: 50, column: 17, scope: !19)
!35 = !DILocation(line: 51, column: 79, scope: !19)
!36 = !DILocation(line: 51, column: 77, scope: !19)
!37 = !DILocation(line: 52, column: 5, scope: !19)
!38 = !DILocation(line: 53, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_45_good", scope: !10, file: !10, line: 89, type: !20, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DILocation(line: 91, column: 5, scope: !39)
!41 = !DILocation(line: 92, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 103, type: !43, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !10, line: 103, type: !45)
!48 = !DILocation(line: 103, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !10, line: 103, type: !46)
!50 = !DILocation(line: 103, column: 27, scope: !42)
!51 = !DILocation(line: 106, column: 22, scope: !42)
!52 = !DILocation(line: 106, column: 12, scope: !42)
!53 = !DILocation(line: 106, column: 5, scope: !42)
!54 = !DILocation(line: 108, column: 5, scope: !42)
!55 = !DILocation(line: 109, column: 5, scope: !42)
!56 = !DILocation(line: 110, column: 5, scope: !42)
!57 = !DILocation(line: 113, column: 5, scope: !42)
!58 = !DILocation(line: 114, column: 5, scope: !42)
!59 = !DILocation(line: 115, column: 5, scope: !42)
!60 = !DILocation(line: 117, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocalVariable(name: "data", scope: !61, file: !10, line: 28, type: !11)
!63 = !DILocation(line: 28, column: 12, scope: !61)
!64 = !DILocation(line: 28, column: 19, scope: !61)
!65 = !DILocalVariable(name: "dest", scope: !66, file: !10, line: 30, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !10, line: 29, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 400, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 50)
!70 = !DILocation(line: 30, column: 14, scope: !66)
!71 = !DILocalVariable(name: "i", scope: !66, file: !10, line: 31, type: !72)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !73, line: 46, baseType: !74)
!73 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!74 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!75 = !DILocation(line: 31, column: 16, scope: !66)
!76 = !DILocalVariable(name: "dataLen", scope: !66, file: !10, line: 31, type: !72)
!77 = !DILocation(line: 31, column: 19, scope: !66)
!78 = !DILocation(line: 32, column: 26, scope: !66)
!79 = !DILocation(line: 32, column: 19, scope: !66)
!80 = !DILocation(line: 32, column: 17, scope: !66)
!81 = !DILocation(line: 34, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !66, file: !10, line: 34, column: 9)
!83 = !DILocation(line: 34, column: 14, scope: !82)
!84 = !DILocation(line: 34, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !10, line: 34, column: 9)
!86 = !DILocation(line: 34, column: 25, scope: !85)
!87 = !DILocation(line: 34, column: 23, scope: !85)
!88 = !DILocation(line: 34, column: 9, scope: !82)
!89 = !DILocation(line: 36, column: 23, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !10, line: 35, column: 9)
!91 = !DILocation(line: 36, column: 28, scope: !90)
!92 = !DILocation(line: 36, column: 18, scope: !90)
!93 = !DILocation(line: 36, column: 13, scope: !90)
!94 = !DILocation(line: 36, column: 21, scope: !90)
!95 = !DILocation(line: 37, column: 9, scope: !90)
!96 = !DILocation(line: 34, column: 35, scope: !85)
!97 = !DILocation(line: 34, column: 9, scope: !85)
!98 = distinct !{!98, !88, !99, !100}
!99 = !DILocation(line: 37, column: 9, scope: !82)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocation(line: 38, column: 9, scope: !66)
!102 = !DILocation(line: 38, column: 20, scope: !66)
!103 = !DILocation(line: 39, column: 19, scope: !66)
!104 = !DILocation(line: 39, column: 9, scope: !66)
!105 = !DILocation(line: 41, column: 1, scope: !61)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 77, type: !20, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !10, line: 79, type: !11)
!108 = !DILocation(line: 79, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !10, line: 80, type: !25)
!110 = !DILocation(line: 80, column: 10, scope: !106)
!111 = !DILocation(line: 81, column: 12, scope: !106)
!112 = !DILocation(line: 81, column: 10, scope: !106)
!113 = !DILocation(line: 83, column: 12, scope: !106)
!114 = !DILocation(line: 83, column: 5, scope: !106)
!115 = !DILocation(line: 84, column: 5, scope: !106)
!116 = !DILocation(line: 84, column: 16, scope: !106)
!117 = !DILocation(line: 85, column: 83, scope: !106)
!118 = !DILocation(line: 85, column: 81, scope: !106)
!119 = !DILocation(line: 86, column: 5, scope: !106)
!120 = !DILocation(line: 87, column: 1, scope: !106)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 60, type: !20, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!122 = !DILocalVariable(name: "data", scope: !121, file: !10, line: 62, type: !11)
!123 = !DILocation(line: 62, column: 12, scope: !121)
!124 = !DILocation(line: 62, column: 19, scope: !121)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !10, line: 64, type: !67)
!126 = distinct !DILexicalBlock(scope: !121, file: !10, line: 63, column: 5)
!127 = !DILocation(line: 64, column: 14, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !10, line: 65, type: !72)
!129 = !DILocation(line: 65, column: 16, scope: !126)
!130 = !DILocalVariable(name: "dataLen", scope: !126, file: !10, line: 65, type: !72)
!131 = !DILocation(line: 65, column: 19, scope: !126)
!132 = !DILocation(line: 66, column: 26, scope: !126)
!133 = !DILocation(line: 66, column: 19, scope: !126)
!134 = !DILocation(line: 66, column: 17, scope: !126)
!135 = !DILocation(line: 68, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !126, file: !10, line: 68, column: 9)
!137 = !DILocation(line: 68, column: 14, scope: !136)
!138 = !DILocation(line: 68, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !10, line: 68, column: 9)
!140 = !DILocation(line: 68, column: 25, scope: !139)
!141 = !DILocation(line: 68, column: 23, scope: !139)
!142 = !DILocation(line: 68, column: 9, scope: !136)
!143 = !DILocation(line: 70, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !10, line: 69, column: 9)
!145 = !DILocation(line: 70, column: 28, scope: !144)
!146 = !DILocation(line: 70, column: 18, scope: !144)
!147 = !DILocation(line: 70, column: 13, scope: !144)
!148 = !DILocation(line: 70, column: 21, scope: !144)
!149 = !DILocation(line: 71, column: 9, scope: !144)
!150 = !DILocation(line: 68, column: 35, scope: !139)
!151 = !DILocation(line: 68, column: 9, scope: !139)
!152 = distinct !{!152, !142, !153, !100}
!153 = !DILocation(line: 71, column: 9, scope: !136)
!154 = !DILocation(line: 72, column: 9, scope: !126)
!155 = !DILocation(line: 72, column: 20, scope: !126)
!156 = !DILocation(line: 73, column: 19, scope: !126)
!157 = !DILocation(line: 73, column: 9, scope: !126)
!158 = !DILocation(line: 75, column: 1, scope: !121)
