; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %0, i8** %dataBuffer, align 8, !dbg !24
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  store i8* %1, i8** %data, align 8, !dbg !27
  %2 = load i32, i32* @staticFive, align 4, !dbg !28
  %cmp = icmp eq i32 %2, 5, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  %call = call i64 @strlen(i8* %6) #6, !dbg !52
  store i64 %call, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !57
  %8 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp1 = icmp ult i64 %7, %8, !dbg !60
  br i1 %cmp1, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !62
  %11 = load i8, i8* %arrayidx2, align 1, !dbg !62
  %12 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !66
  store i8 %11, i8* %arrayidx3, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %13, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !74
  store i8 0, i8* %arrayidx4, align 1, !dbg !75
  %14 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %14), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 100, align 16, !dbg !106
  store i8* %0, i8** %dataBuffer, align 8, !dbg !105
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %1, i8** %data, align 8, !dbg !108
  %2 = load i32, i32* @staticFive, align 4, !dbg !109
  %cmp = icmp ne i32 %2, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !126, metadata !DIExpression()), !dbg !127
  %6 = load i8*, i8** %data, align 8, !dbg !128
  %call = call i64 @strlen(i8* %6) #6, !dbg !129
  store i64 %call, i64* %dataLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !134
  %8 = load i64, i64* %dataLen, align 8, !dbg !136
  %cmp1 = icmp ult i64 %7, %8, !dbg !137
  br i1 %cmp1, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !139
  %10 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !139
  %11 = load i8, i8* %arrayidx2, align 1, !dbg !139
  %12 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !143
  store i8 %11, i8* %arrayidx3, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %13, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !150
  store i8 0, i8* %arrayidx4, align 1, !dbg !151
  %14 = load i8*, i8** %data, align 8, !dbg !152
  call void @printLine(i8* %14), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = alloca i8, i64 100, align 16, !dbg !160
  store i8* %0, i8** %dataBuffer, align 8, !dbg !159
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !161
  store i8* %1, i8** %data, align 8, !dbg !162
  %2 = load i32, i32* @staticFive, align 4, !dbg !163
  %cmp = icmp eq i32 %2, 5, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !169
  %4 = load i8*, i8** %data, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !173, metadata !DIExpression()), !dbg !175
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !178, metadata !DIExpression()), !dbg !179
  %6 = load i8*, i8** %data, align 8, !dbg !180
  %call = call i64 @strlen(i8* %6) #6, !dbg !181
  store i64 %call, i64* %dataLen, align 8, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !186
  %8 = load i64, i64* %dataLen, align 8, !dbg !188
  %cmp1 = icmp ult i64 %7, %8, !dbg !189
  br i1 %cmp1, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !191
  %10 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !191
  %11 = load i8, i8* %arrayidx2, align 1, !dbg !191
  %12 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !195
  store i8 %11, i8* %arrayidx3, align 1, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %13, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !202
  store i8 0, i8* %arrayidx4, align 1, !dbg !203
  %14 = load i8*, i8** %data, align 8, !dbg !204
  call void @printLine(i8* %14), !dbg !205
  ret void, !dbg !206
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07_bad", scope: !10, file: !10, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 31, type: !6)
!22 = !DILocation(line: 31, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocation(line: 32, column: 33, scope: !18)
!26 = !DILocation(line: 33, column: 12, scope: !18)
!27 = !DILocation(line: 33, column: 10, scope: !18)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !10, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 18, scope: !29)
!31 = !DILocation(line: 34, column: 8, scope: !18)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 35, column: 5)
!34 = !DILocation(line: 37, column: 9, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 21, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !18, file: !10, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 14, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !10, line: 42, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !39)
!49 = !DILocalVariable(name: "dataLen", scope: !39, file: !10, line: 42, type: !45)
!50 = !DILocation(line: 42, column: 19, scope: !39)
!51 = !DILocation(line: 43, column: 26, scope: !39)
!52 = !DILocation(line: 43, column: 19, scope: !39)
!53 = !DILocation(line: 43, column: 17, scope: !39)
!54 = !DILocation(line: 45, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !39, file: !10, line: 45, column: 9)
!56 = !DILocation(line: 45, column: 14, scope: !55)
!57 = !DILocation(line: 45, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !10, line: 45, column: 9)
!59 = !DILocation(line: 45, column: 25, scope: !58)
!60 = !DILocation(line: 45, column: 23, scope: !58)
!61 = !DILocation(line: 45, column: 9, scope: !55)
!62 = !DILocation(line: 47, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !10, line: 46, column: 9)
!64 = !DILocation(line: 47, column: 28, scope: !63)
!65 = !DILocation(line: 47, column: 18, scope: !63)
!66 = !DILocation(line: 47, column: 13, scope: !63)
!67 = !DILocation(line: 47, column: 21, scope: !63)
!68 = !DILocation(line: 48, column: 9, scope: !63)
!69 = !DILocation(line: 45, column: 35, scope: !58)
!70 = !DILocation(line: 45, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 48, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 49, column: 9, scope: !39)
!75 = !DILocation(line: 49, column: 20, scope: !39)
!76 = !DILocation(line: 50, column: 19, scope: !39)
!77 = !DILocation(line: 50, column: 9, scope: !39)
!78 = !DILocation(line: 52, column: 1, scope: !18)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_07_good", scope: !10, file: !10, line: 115, type: !19, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 117, column: 5, scope: !79)
!81 = !DILocation(line: 118, column: 5, scope: !79)
!82 = !DILocation(line: 119, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 131, type: !84, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!11, !11, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !10, line: 131, type: !11)
!88 = !DILocation(line: 131, column: 14, scope: !83)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !10, line: 131, type: !86)
!90 = !DILocation(line: 131, column: 27, scope: !83)
!91 = !DILocation(line: 134, column: 22, scope: !83)
!92 = !DILocation(line: 134, column: 12, scope: !83)
!93 = !DILocation(line: 134, column: 5, scope: !83)
!94 = !DILocation(line: 136, column: 5, scope: !83)
!95 = !DILocation(line: 137, column: 5, scope: !83)
!96 = !DILocation(line: 138, column: 5, scope: !83)
!97 = !DILocation(line: 141, column: 5, scope: !83)
!98 = !DILocation(line: 142, column: 5, scope: !83)
!99 = !DILocation(line: 143, column: 5, scope: !83)
!100 = !DILocation(line: 145, column: 5, scope: !83)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !10, line: 61, type: !6)
!103 = !DILocation(line: 61, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !10, line: 62, type: !6)
!105 = !DILocation(line: 62, column: 12, scope: !101)
!106 = !DILocation(line: 62, column: 33, scope: !101)
!107 = !DILocation(line: 63, column: 12, scope: !101)
!108 = !DILocation(line: 63, column: 10, scope: !101)
!109 = !DILocation(line: 64, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !10, line: 64, column: 8)
!111 = !DILocation(line: 64, column: 18, scope: !110)
!112 = !DILocation(line: 64, column: 8, scope: !101)
!113 = !DILocation(line: 67, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !10, line: 65, column: 5)
!115 = !DILocation(line: 68, column: 5, scope: !114)
!116 = !DILocation(line: 72, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !10, line: 70, column: 5)
!118 = !DILocation(line: 72, column: 9, scope: !117)
!119 = !DILocation(line: 73, column: 9, scope: !117)
!120 = !DILocation(line: 73, column: 20, scope: !117)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !10, line: 76, type: !40)
!122 = distinct !DILexicalBlock(scope: !101, file: !10, line: 75, column: 5)
!123 = !DILocation(line: 76, column: 14, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !10, line: 77, type: !45)
!125 = !DILocation(line: 77, column: 16, scope: !122)
!126 = !DILocalVariable(name: "dataLen", scope: !122, file: !10, line: 77, type: !45)
!127 = !DILocation(line: 77, column: 19, scope: !122)
!128 = !DILocation(line: 78, column: 26, scope: !122)
!129 = !DILocation(line: 78, column: 19, scope: !122)
!130 = !DILocation(line: 78, column: 17, scope: !122)
!131 = !DILocation(line: 80, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !10, line: 80, column: 9)
!133 = !DILocation(line: 80, column: 14, scope: !132)
!134 = !DILocation(line: 80, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !10, line: 80, column: 9)
!136 = !DILocation(line: 80, column: 25, scope: !135)
!137 = !DILocation(line: 80, column: 23, scope: !135)
!138 = !DILocation(line: 80, column: 9, scope: !132)
!139 = !DILocation(line: 82, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !10, line: 81, column: 9)
!141 = !DILocation(line: 82, column: 28, scope: !140)
!142 = !DILocation(line: 82, column: 18, scope: !140)
!143 = !DILocation(line: 82, column: 13, scope: !140)
!144 = !DILocation(line: 82, column: 21, scope: !140)
!145 = !DILocation(line: 83, column: 9, scope: !140)
!146 = !DILocation(line: 80, column: 35, scope: !135)
!147 = !DILocation(line: 80, column: 9, scope: !135)
!148 = distinct !{!148, !138, !149, !73}
!149 = !DILocation(line: 83, column: 9, scope: !132)
!150 = !DILocation(line: 84, column: 9, scope: !122)
!151 = !DILocation(line: 84, column: 20, scope: !122)
!152 = !DILocation(line: 85, column: 19, scope: !122)
!153 = !DILocation(line: 85, column: 9, scope: !122)
!154 = !DILocation(line: 87, column: 1, scope: !101)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 90, type: !19, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DILocalVariable(name: "data", scope: !155, file: !10, line: 92, type: !6)
!157 = !DILocation(line: 92, column: 12, scope: !155)
!158 = !DILocalVariable(name: "dataBuffer", scope: !155, file: !10, line: 93, type: !6)
!159 = !DILocation(line: 93, column: 12, scope: !155)
!160 = !DILocation(line: 93, column: 33, scope: !155)
!161 = !DILocation(line: 94, column: 12, scope: !155)
!162 = !DILocation(line: 94, column: 10, scope: !155)
!163 = !DILocation(line: 95, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !155, file: !10, line: 95, column: 8)
!165 = !DILocation(line: 95, column: 18, scope: !164)
!166 = !DILocation(line: 95, column: 8, scope: !155)
!167 = !DILocation(line: 98, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !10, line: 96, column: 5)
!169 = !DILocation(line: 98, column: 9, scope: !168)
!170 = !DILocation(line: 99, column: 9, scope: !168)
!171 = !DILocation(line: 99, column: 20, scope: !168)
!172 = !DILocation(line: 100, column: 5, scope: !168)
!173 = !DILocalVariable(name: "dest", scope: !174, file: !10, line: 102, type: !40)
!174 = distinct !DILexicalBlock(scope: !155, file: !10, line: 101, column: 5)
!175 = !DILocation(line: 102, column: 14, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !174, file: !10, line: 103, type: !45)
!177 = !DILocation(line: 103, column: 16, scope: !174)
!178 = !DILocalVariable(name: "dataLen", scope: !174, file: !10, line: 103, type: !45)
!179 = !DILocation(line: 103, column: 19, scope: !174)
!180 = !DILocation(line: 104, column: 26, scope: !174)
!181 = !DILocation(line: 104, column: 19, scope: !174)
!182 = !DILocation(line: 104, column: 17, scope: !174)
!183 = !DILocation(line: 106, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !10, line: 106, column: 9)
!185 = !DILocation(line: 106, column: 14, scope: !184)
!186 = !DILocation(line: 106, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !10, line: 106, column: 9)
!188 = !DILocation(line: 106, column: 25, scope: !187)
!189 = !DILocation(line: 106, column: 23, scope: !187)
!190 = !DILocation(line: 106, column: 9, scope: !184)
!191 = !DILocation(line: 108, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !10, line: 107, column: 9)
!193 = !DILocation(line: 108, column: 28, scope: !192)
!194 = !DILocation(line: 108, column: 18, scope: !192)
!195 = !DILocation(line: 108, column: 13, scope: !192)
!196 = !DILocation(line: 108, column: 21, scope: !192)
!197 = !DILocation(line: 109, column: 9, scope: !192)
!198 = !DILocation(line: 106, column: 35, scope: !187)
!199 = !DILocation(line: 106, column: 9, scope: !187)
!200 = distinct !{!200, !190, !201, !73}
!201 = !DILocation(line: 109, column: 9, scope: !184)
!202 = !DILocation(line: 110, column: 9, scope: !174)
!203 = !DILocation(line: 110, column: 20, scope: !174)
!204 = !DILocation(line: 111, column: 19, scope: !174)
!205 = !DILocation(line: 111, column: 9, scope: !174)
!206 = !DILocation(line: 113, column: 1, scope: !155)
