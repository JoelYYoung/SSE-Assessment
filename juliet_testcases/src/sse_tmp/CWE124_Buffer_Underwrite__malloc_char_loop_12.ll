; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataBuffer3 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !28
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !27
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then2, label %if.end, !dbg !32

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !40
  store i8* %add.ptr, i8** %data, align 8, !dbg !41
  br label %if.end9, !dbg !42

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer3, metadata !43, metadata !DIExpression()), !dbg !46
  %call4 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !47
  store i8* %call4, i8** %dataBuffer3, align 8, !dbg !46
  %4 = load i8*, i8** %dataBuffer3, align 8, !dbg !48
  %cmp5 = icmp eq i8* %4, null, !dbg !50
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !51

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !52
  unreachable, !dbg !52

if.end7:                                          ; preds = %if.else
  %5 = load i8*, i8** %dataBuffer3, align 8, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 65, i64 99, i1 false), !dbg !55
  %6 = load i8*, i8** %dataBuffer3, align 8, !dbg !56
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !56
  store i8 0, i8* %arrayidx8, align 1, !dbg !57
  %7 = load i8*, i8** %dataBuffer3, align 8, !dbg !58
  store i8* %7, i8** %data, align 8, !dbg !59
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !60, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !66, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !71
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !72
  store i8 0, i8* %arrayidx10, align 1, !dbg !73
  store i64 0, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !76

for.cond:                                         ; preds = %for.inc, %if.end9
  %8 = load i64, i64* %i, align 8, !dbg !77
  %cmp11 = icmp ult i64 %8, 100, !dbg !79
  br i1 %cmp11, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx12 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %9, !dbg !83
  %10 = load i8, i8* %arrayidx12, align 1, !dbg !83
  %11 = load i8*, i8** %data, align 8, !dbg !84
  %12 = load i64, i64* %i, align 8, !dbg !85
  %arrayidx13 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !84
  store i8 %10, i8* %arrayidx13, align 1, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !88
  %inc = add i64 %13, 1, !dbg !88
  store i64 %inc, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx14 = getelementptr inbounds i8, i8* %14, i64 99, !dbg !93
  store i8 0, i8* %arrayidx14, align 1, !dbg !94
  %15 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* %15), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_12_good() #0 !dbg !98 {
entry:
  call void @goodG2B(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* null) #6, !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 %conv) #6, !dbg !112
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !113
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_12_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_12_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !120 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataBuffer3 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i8* null, i8** %data, align 8, !dbg !123
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !124
  %tobool = icmp ne i32 %call, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.else, !dbg !126

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !127, metadata !DIExpression()), !dbg !130
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !131
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !130
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !132
  %cmp = icmp eq i8* %0, null, !dbg !134
  br i1 %cmp, label %if.then2, label %if.end, !dbg !135

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !139
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !140
  store i8 0, i8* %arrayidx, align 1, !dbg !141
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !142
  store i8* %3, i8** %data, align 8, !dbg !143
  br label %if.end9, !dbg !144

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer3, metadata !145, metadata !DIExpression()), !dbg !148
  %call4 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !149
  store i8* %call4, i8** %dataBuffer3, align 8, !dbg !148
  %4 = load i8*, i8** %dataBuffer3, align 8, !dbg !150
  %cmp5 = icmp eq i8* %4, null, !dbg !152
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !153

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !154
  unreachable, !dbg !154

if.end7:                                          ; preds = %if.else
  %5 = load i8*, i8** %dataBuffer3, align 8, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 65, i64 99, i1 false), !dbg !157
  %6 = load i8*, i8** %dataBuffer3, align 8, !dbg !158
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !158
  store i8 0, i8* %arrayidx8, align 1, !dbg !159
  %7 = load i8*, i8** %dataBuffer3, align 8, !dbg !160
  store i8* %7, i8** %data, align 8, !dbg !161
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !165, metadata !DIExpression()), !dbg !166
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !167
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !168
  store i8 0, i8* %arrayidx10, align 1, !dbg !169
  store i64 0, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %if.end9
  %8 = load i64, i64* %i, align 8, !dbg !173
  %cmp11 = icmp ult i64 %8, 100, !dbg !175
  br i1 %cmp11, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx12 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %9, !dbg !179
  %10 = load i8, i8* %arrayidx12, align 1, !dbg !179
  %11 = load i8*, i8** %data, align 8, !dbg !180
  %12 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx13 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !180
  store i8 %10, i8* %arrayidx13, align 1, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %13, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !188
  %arrayidx14 = getelementptr inbounds i8, i8* %14, i64 99, !dbg !188
  store i8 0, i8* %arrayidx14, align 1, !dbg !189
  %15 = load i8*, i8** %data, align 8, !dbg !190
  call void @printLine(i8* %15), !dbg !191
  ret void, !dbg !192
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_12_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 30, type: !4)
!25 = distinct !DILexicalBlock(scope: !26, file: !15, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!27 = !DILocation(line: 30, column: 20, scope: !25)
!28 = !DILocation(line: 30, column: 41, scope: !25)
!29 = !DILocation(line: 31, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 17)
!31 = !DILocation(line: 31, column: 28, scope: !30)
!32 = !DILocation(line: 31, column: 17, scope: !25)
!33 = !DILocation(line: 31, column: 38, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 31, column: 37)
!35 = !DILocation(line: 32, column: 20, scope: !25)
!36 = !DILocation(line: 32, column: 13, scope: !25)
!37 = !DILocation(line: 33, column: 13, scope: !25)
!38 = !DILocation(line: 33, column: 31, scope: !25)
!39 = !DILocation(line: 35, column: 20, scope: !25)
!40 = !DILocation(line: 35, column: 31, scope: !25)
!41 = !DILocation(line: 35, column: 18, scope: !25)
!42 = !DILocation(line: 37, column: 5, scope: !26)
!43 = !DILocalVariable(name: "dataBuffer", scope: !44, file: !15, line: 41, type: !4)
!44 = distinct !DILexicalBlock(scope: !45, file: !15, line: 40, column: 9)
!45 = distinct !DILexicalBlock(scope: !22, file: !15, line: 39, column: 5)
!46 = !DILocation(line: 41, column: 20, scope: !44)
!47 = !DILocation(line: 41, column: 41, scope: !44)
!48 = !DILocation(line: 42, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !15, line: 42, column: 17)
!50 = !DILocation(line: 42, column: 28, scope: !49)
!51 = !DILocation(line: 42, column: 17, scope: !44)
!52 = !DILocation(line: 42, column: 38, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 42, column: 37)
!54 = !DILocation(line: 43, column: 20, scope: !44)
!55 = !DILocation(line: 43, column: 13, scope: !44)
!56 = !DILocation(line: 44, column: 13, scope: !44)
!57 = !DILocation(line: 44, column: 31, scope: !44)
!58 = !DILocation(line: 46, column: 20, scope: !44)
!59 = !DILocation(line: 46, column: 18, scope: !44)
!60 = !DILocalVariable(name: "i", scope: !61, file: !15, line: 50, type: !62)
!61 = distinct !DILexicalBlock(scope: !14, file: !15, line: 49, column: 5)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !63, line: 46, baseType: !64)
!63 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!64 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!65 = !DILocation(line: 50, column: 16, scope: !61)
!66 = !DILocalVariable(name: "source", scope: !61, file: !15, line: 51, type: !67)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 100)
!70 = !DILocation(line: 51, column: 14, scope: !61)
!71 = !DILocation(line: 52, column: 9, scope: !61)
!72 = !DILocation(line: 53, column: 9, scope: !61)
!73 = !DILocation(line: 53, column: 23, scope: !61)
!74 = !DILocation(line: 55, column: 16, scope: !75)
!75 = distinct !DILexicalBlock(scope: !61, file: !15, line: 55, column: 9)
!76 = !DILocation(line: 55, column: 14, scope: !75)
!77 = !DILocation(line: 55, column: 21, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !15, line: 55, column: 9)
!79 = !DILocation(line: 55, column: 23, scope: !78)
!80 = !DILocation(line: 55, column: 9, scope: !75)
!81 = !DILocation(line: 57, column: 30, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 56, column: 9)
!83 = !DILocation(line: 57, column: 23, scope: !82)
!84 = !DILocation(line: 57, column: 13, scope: !82)
!85 = !DILocation(line: 57, column: 18, scope: !82)
!86 = !DILocation(line: 57, column: 21, scope: !82)
!87 = !DILocation(line: 58, column: 9, scope: !82)
!88 = !DILocation(line: 55, column: 31, scope: !78)
!89 = !DILocation(line: 55, column: 9, scope: !78)
!90 = distinct !{!90, !80, !91, !92}
!91 = !DILocation(line: 58, column: 9, scope: !75)
!92 = !{!"llvm.loop.mustprogress"}
!93 = !DILocation(line: 60, column: 9, scope: !61)
!94 = !DILocation(line: 60, column: 21, scope: !61)
!95 = !DILocation(line: 61, column: 19, scope: !61)
!96 = !DILocation(line: 61, column: 9, scope: !61)
!97 = !DILocation(line: 65, column: 1, scope: !14)
!98 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_12_good", scope: !15, file: !15, line: 117, type: !16, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocation(line: 119, column: 5, scope: !98)
!100 = !DILocation(line: 120, column: 1, scope: !98)
!101 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 132, type: !102, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!104, !104, !105}
!104 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !15, line: 132, type: !104)
!107 = !DILocation(line: 132, column: 14, scope: !101)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !15, line: 132, type: !105)
!109 = !DILocation(line: 132, column: 27, scope: !101)
!110 = !DILocation(line: 135, column: 22, scope: !101)
!111 = !DILocation(line: 135, column: 12, scope: !101)
!112 = !DILocation(line: 135, column: 5, scope: !101)
!113 = !DILocation(line: 137, column: 5, scope: !101)
!114 = !DILocation(line: 138, column: 5, scope: !101)
!115 = !DILocation(line: 139, column: 5, scope: !101)
!116 = !DILocation(line: 142, column: 5, scope: !101)
!117 = !DILocation(line: 143, column: 5, scope: !101)
!118 = !DILocation(line: 144, column: 5, scope: !101)
!119 = !DILocation(line: 146, column: 5, scope: !101)
!120 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 73, type: !16, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !15, line: 75, type: !4)
!122 = !DILocation(line: 75, column: 12, scope: !120)
!123 = !DILocation(line: 76, column: 10, scope: !120)
!124 = !DILocation(line: 77, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !15, line: 77, column: 8)
!126 = !DILocation(line: 77, column: 8, scope: !120)
!127 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !15, line: 80, type: !4)
!128 = distinct !DILexicalBlock(scope: !129, file: !15, line: 79, column: 9)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 78, column: 5)
!130 = !DILocation(line: 80, column: 20, scope: !128)
!131 = !DILocation(line: 80, column: 41, scope: !128)
!132 = !DILocation(line: 81, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !15, line: 81, column: 17)
!134 = !DILocation(line: 81, column: 28, scope: !133)
!135 = !DILocation(line: 81, column: 17, scope: !128)
!136 = !DILocation(line: 81, column: 38, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 81, column: 37)
!138 = !DILocation(line: 82, column: 20, scope: !128)
!139 = !DILocation(line: 82, column: 13, scope: !128)
!140 = !DILocation(line: 83, column: 13, scope: !128)
!141 = !DILocation(line: 83, column: 31, scope: !128)
!142 = !DILocation(line: 85, column: 20, scope: !128)
!143 = !DILocation(line: 85, column: 18, scope: !128)
!144 = !DILocation(line: 87, column: 5, scope: !129)
!145 = !DILocalVariable(name: "dataBuffer", scope: !146, file: !15, line: 91, type: !4)
!146 = distinct !DILexicalBlock(scope: !147, file: !15, line: 90, column: 9)
!147 = distinct !DILexicalBlock(scope: !125, file: !15, line: 89, column: 5)
!148 = !DILocation(line: 91, column: 20, scope: !146)
!149 = !DILocation(line: 91, column: 41, scope: !146)
!150 = !DILocation(line: 92, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !15, line: 92, column: 17)
!152 = !DILocation(line: 92, column: 28, scope: !151)
!153 = !DILocation(line: 92, column: 17, scope: !146)
!154 = !DILocation(line: 92, column: 38, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !15, line: 92, column: 37)
!156 = !DILocation(line: 93, column: 20, scope: !146)
!157 = !DILocation(line: 93, column: 13, scope: !146)
!158 = !DILocation(line: 94, column: 13, scope: !146)
!159 = !DILocation(line: 94, column: 31, scope: !146)
!160 = !DILocation(line: 96, column: 20, scope: !146)
!161 = !DILocation(line: 96, column: 18, scope: !146)
!162 = !DILocalVariable(name: "i", scope: !163, file: !15, line: 100, type: !62)
!163 = distinct !DILexicalBlock(scope: !120, file: !15, line: 99, column: 5)
!164 = !DILocation(line: 100, column: 16, scope: !163)
!165 = !DILocalVariable(name: "source", scope: !163, file: !15, line: 101, type: !67)
!166 = !DILocation(line: 101, column: 14, scope: !163)
!167 = !DILocation(line: 102, column: 9, scope: !163)
!168 = !DILocation(line: 103, column: 9, scope: !163)
!169 = !DILocation(line: 103, column: 23, scope: !163)
!170 = !DILocation(line: 105, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !163, file: !15, line: 105, column: 9)
!172 = !DILocation(line: 105, column: 14, scope: !171)
!173 = !DILocation(line: 105, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !15, line: 105, column: 9)
!175 = !DILocation(line: 105, column: 23, scope: !174)
!176 = !DILocation(line: 105, column: 9, scope: !171)
!177 = !DILocation(line: 107, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !15, line: 106, column: 9)
!179 = !DILocation(line: 107, column: 23, scope: !178)
!180 = !DILocation(line: 107, column: 13, scope: !178)
!181 = !DILocation(line: 107, column: 18, scope: !178)
!182 = !DILocation(line: 107, column: 21, scope: !178)
!183 = !DILocation(line: 108, column: 9, scope: !178)
!184 = !DILocation(line: 105, column: 31, scope: !174)
!185 = !DILocation(line: 105, column: 9, scope: !174)
!186 = distinct !{!186, !176, !187, !92}
!187 = !DILocation(line: 108, column: 9, scope: !171)
!188 = !DILocation(line: 110, column: 9, scope: !163)
!189 = !DILocation(line: 110, column: 21, scope: !163)
!190 = !DILocation(line: 111, column: 19, scope: !163)
!191 = !DILocation(line: 111, column: 9, scope: !163)
!192 = !DILocation(line: 115, column: 1, scope: !120)
