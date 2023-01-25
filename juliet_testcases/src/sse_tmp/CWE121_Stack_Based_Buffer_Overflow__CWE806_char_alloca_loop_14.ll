; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i32, i32* @globalFive, align 4, !dbg !24
  %cmp = icmp eq i32 %2, 5, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  %call = call i64 @strlen(i8* %6) #6, !dbg !48
  store i64 %call, i64* %dataLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !53
  %8 = load i64, i64* %dataLen, align 8, !dbg !55
  %cmp1 = icmp ult i64 %7, %8, !dbg !56
  br i1 %cmp1, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !58
  %10 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !58
  %11 = load i8, i8* %arrayidx2, align 1, !dbg !58
  %12 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !62
  store i8 %11, i8* %arrayidx3, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %13, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !70
  store i8 0, i8* %arrayidx4, align 1, !dbg !71
  %14 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %14), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 100, align 16, !dbg !103
  store i8* %0, i8** %dataBuffer, align 8, !dbg !102
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  store i8* %1, i8** %data, align 8, !dbg !105
  %2 = load i32, i32* @globalFive, align 4, !dbg !106
  %cmp = icmp ne i32 %2, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !123, metadata !DIExpression()), !dbg !124
  %6 = load i8*, i8** %data, align 8, !dbg !125
  %call = call i64 @strlen(i8* %6) #6, !dbg !126
  store i64 %call, i64* %dataLen, align 8, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !131
  %8 = load i64, i64* %dataLen, align 8, !dbg !133
  %cmp1 = icmp ult i64 %7, %8, !dbg !134
  br i1 %cmp1, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !136
  %10 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !136
  %11 = load i8, i8* %arrayidx2, align 1, !dbg !136
  %12 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !140
  store i8 %11, i8* %arrayidx3, align 1, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %13, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !147
  store i8 0, i8* %arrayidx4, align 1, !dbg !148
  %14 = load i8*, i8** %data, align 8, !dbg !149
  call void @printLine(i8* %14), !dbg !150
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !152 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %0 = alloca i8, i64 100, align 16, !dbg !157
  store i8* %0, i8** %dataBuffer, align 8, !dbg !156
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !158
  store i8* %1, i8** %data, align 8, !dbg !159
  %2 = load i32, i32* @globalFive, align 4, !dbg !160
  %cmp = icmp eq i32 %2, 5, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !166
  %4 = load i8*, i8** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !170, metadata !DIExpression()), !dbg !172
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !175, metadata !DIExpression()), !dbg !176
  %6 = load i8*, i8** %data, align 8, !dbg !177
  %call = call i64 @strlen(i8* %6) #6, !dbg !178
  store i64 %call, i64* %dataLen, align 8, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !183
  %8 = load i64, i64* %dataLen, align 8, !dbg !185
  %cmp1 = icmp ult i64 %7, %8, !dbg !186
  br i1 %cmp1, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !188
  %10 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !188
  %11 = load i8, i8* %arrayidx2, align 1, !dbg !188
  %12 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !192
  store i8 %11, i8* %arrayidx3, align 1, !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !195
  %inc = add i64 %13, 1, !dbg !195
  store i64 %inc, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !196, !llvm.loop !197

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !199
  store i8 0, i8* %arrayidx4, align 1, !dbg !200
  %14 = load i8*, i8** %data, align 8, !dbg !201
  call void @printLine(i8* %14), !dbg !202
  ret void, !dbg !203
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 28, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!26 = !DILocation(line: 28, column: 18, scope: !25)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 31, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 31, column: 9, scope: !29)
!31 = !DILocation(line: 32, column: 9, scope: !29)
!32 = !DILocation(line: 32, column: 21, scope: !29)
!33 = !DILocation(line: 33, column: 5, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !14, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 35, column: 14, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 36, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 36, column: 16, scope: !35)
!45 = !DILocalVariable(name: "dataLen", scope: !35, file: !14, line: 36, type: !41)
!46 = !DILocation(line: 36, column: 19, scope: !35)
!47 = !DILocation(line: 37, column: 26, scope: !35)
!48 = !DILocation(line: 37, column: 19, scope: !35)
!49 = !DILocation(line: 37, column: 17, scope: !35)
!50 = !DILocation(line: 39, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !35, file: !14, line: 39, column: 9)
!52 = !DILocation(line: 39, column: 14, scope: !51)
!53 = !DILocation(line: 39, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !14, line: 39, column: 9)
!55 = !DILocation(line: 39, column: 25, scope: !54)
!56 = !DILocation(line: 39, column: 23, scope: !54)
!57 = !DILocation(line: 39, column: 9, scope: !51)
!58 = !DILocation(line: 41, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !14, line: 40, column: 9)
!60 = !DILocation(line: 41, column: 28, scope: !59)
!61 = !DILocation(line: 41, column: 18, scope: !59)
!62 = !DILocation(line: 41, column: 13, scope: !59)
!63 = !DILocation(line: 41, column: 21, scope: !59)
!64 = !DILocation(line: 42, column: 9, scope: !59)
!65 = !DILocation(line: 39, column: 35, scope: !54)
!66 = !DILocation(line: 39, column: 9, scope: !54)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 42, column: 9, scope: !51)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 43, column: 9, scope: !35)
!71 = !DILocation(line: 43, column: 20, scope: !35)
!72 = !DILocation(line: 44, column: 19, scope: !35)
!73 = !DILocation(line: 44, column: 9, scope: !35)
!74 = !DILocation(line: 46, column: 1, scope: !13)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_14_good", scope: !14, file: !14, line: 109, type: !15, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 111, column: 5, scope: !75)
!77 = !DILocation(line: 112, column: 5, scope: !75)
!78 = !DILocation(line: 113, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 125, type: !80, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !14, line: 125, type: !82)
!85 = !DILocation(line: 125, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !14, line: 125, type: !83)
!87 = !DILocation(line: 125, column: 27, scope: !79)
!88 = !DILocation(line: 128, column: 22, scope: !79)
!89 = !DILocation(line: 128, column: 12, scope: !79)
!90 = !DILocation(line: 128, column: 5, scope: !79)
!91 = !DILocation(line: 130, column: 5, scope: !79)
!92 = !DILocation(line: 131, column: 5, scope: !79)
!93 = !DILocation(line: 132, column: 5, scope: !79)
!94 = !DILocation(line: 135, column: 5, scope: !79)
!95 = !DILocation(line: 136, column: 5, scope: !79)
!96 = !DILocation(line: 137, column: 5, scope: !79)
!97 = !DILocation(line: 139, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 55, type: !4)
!100 = !DILocation(line: 55, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !14, line: 56, type: !4)
!102 = !DILocation(line: 56, column: 12, scope: !98)
!103 = !DILocation(line: 56, column: 33, scope: !98)
!104 = !DILocation(line: 57, column: 12, scope: !98)
!105 = !DILocation(line: 57, column: 10, scope: !98)
!106 = !DILocation(line: 58, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !98, file: !14, line: 58, column: 8)
!108 = !DILocation(line: 58, column: 18, scope: !107)
!109 = !DILocation(line: 58, column: 8, scope: !98)
!110 = !DILocation(line: 61, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !14, line: 59, column: 5)
!112 = !DILocation(line: 62, column: 5, scope: !111)
!113 = !DILocation(line: 66, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !14, line: 64, column: 5)
!115 = !DILocation(line: 66, column: 9, scope: !114)
!116 = !DILocation(line: 67, column: 9, scope: !114)
!117 = !DILocation(line: 67, column: 20, scope: !114)
!118 = !DILocalVariable(name: "dest", scope: !119, file: !14, line: 70, type: !36)
!119 = distinct !DILexicalBlock(scope: !98, file: !14, line: 69, column: 5)
!120 = !DILocation(line: 70, column: 14, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !119, file: !14, line: 71, type: !41)
!122 = !DILocation(line: 71, column: 16, scope: !119)
!123 = !DILocalVariable(name: "dataLen", scope: !119, file: !14, line: 71, type: !41)
!124 = !DILocation(line: 71, column: 19, scope: !119)
!125 = !DILocation(line: 72, column: 26, scope: !119)
!126 = !DILocation(line: 72, column: 19, scope: !119)
!127 = !DILocation(line: 72, column: 17, scope: !119)
!128 = !DILocation(line: 74, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !119, file: !14, line: 74, column: 9)
!130 = !DILocation(line: 74, column: 14, scope: !129)
!131 = !DILocation(line: 74, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !14, line: 74, column: 9)
!133 = !DILocation(line: 74, column: 25, scope: !132)
!134 = !DILocation(line: 74, column: 23, scope: !132)
!135 = !DILocation(line: 74, column: 9, scope: !129)
!136 = !DILocation(line: 76, column: 23, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !14, line: 75, column: 9)
!138 = !DILocation(line: 76, column: 28, scope: !137)
!139 = !DILocation(line: 76, column: 18, scope: !137)
!140 = !DILocation(line: 76, column: 13, scope: !137)
!141 = !DILocation(line: 76, column: 21, scope: !137)
!142 = !DILocation(line: 77, column: 9, scope: !137)
!143 = !DILocation(line: 74, column: 35, scope: !132)
!144 = !DILocation(line: 74, column: 9, scope: !132)
!145 = distinct !{!145, !135, !146, !69}
!146 = !DILocation(line: 77, column: 9, scope: !129)
!147 = !DILocation(line: 78, column: 9, scope: !119)
!148 = !DILocation(line: 78, column: 20, scope: !119)
!149 = !DILocation(line: 79, column: 19, scope: !119)
!150 = !DILocation(line: 79, column: 9, scope: !119)
!151 = !DILocation(line: 81, column: 1, scope: !98)
!152 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocalVariable(name: "data", scope: !152, file: !14, line: 86, type: !4)
!154 = !DILocation(line: 86, column: 12, scope: !152)
!155 = !DILocalVariable(name: "dataBuffer", scope: !152, file: !14, line: 87, type: !4)
!156 = !DILocation(line: 87, column: 12, scope: !152)
!157 = !DILocation(line: 87, column: 33, scope: !152)
!158 = !DILocation(line: 88, column: 12, scope: !152)
!159 = !DILocation(line: 88, column: 10, scope: !152)
!160 = !DILocation(line: 89, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !152, file: !14, line: 89, column: 8)
!162 = !DILocation(line: 89, column: 18, scope: !161)
!163 = !DILocation(line: 89, column: 8, scope: !152)
!164 = !DILocation(line: 92, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !14, line: 90, column: 5)
!166 = !DILocation(line: 92, column: 9, scope: !165)
!167 = !DILocation(line: 93, column: 9, scope: !165)
!168 = !DILocation(line: 93, column: 20, scope: !165)
!169 = !DILocation(line: 94, column: 5, scope: !165)
!170 = !DILocalVariable(name: "dest", scope: !171, file: !14, line: 96, type: !36)
!171 = distinct !DILexicalBlock(scope: !152, file: !14, line: 95, column: 5)
!172 = !DILocation(line: 96, column: 14, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !171, file: !14, line: 97, type: !41)
!174 = !DILocation(line: 97, column: 16, scope: !171)
!175 = !DILocalVariable(name: "dataLen", scope: !171, file: !14, line: 97, type: !41)
!176 = !DILocation(line: 97, column: 19, scope: !171)
!177 = !DILocation(line: 98, column: 26, scope: !171)
!178 = !DILocation(line: 98, column: 19, scope: !171)
!179 = !DILocation(line: 98, column: 17, scope: !171)
!180 = !DILocation(line: 100, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !14, line: 100, column: 9)
!182 = !DILocation(line: 100, column: 14, scope: !181)
!183 = !DILocation(line: 100, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !14, line: 100, column: 9)
!185 = !DILocation(line: 100, column: 25, scope: !184)
!186 = !DILocation(line: 100, column: 23, scope: !184)
!187 = !DILocation(line: 100, column: 9, scope: !181)
!188 = !DILocation(line: 102, column: 23, scope: !189)
!189 = distinct !DILexicalBlock(scope: !184, file: !14, line: 101, column: 9)
!190 = !DILocation(line: 102, column: 28, scope: !189)
!191 = !DILocation(line: 102, column: 18, scope: !189)
!192 = !DILocation(line: 102, column: 13, scope: !189)
!193 = !DILocation(line: 102, column: 21, scope: !189)
!194 = !DILocation(line: 103, column: 9, scope: !189)
!195 = !DILocation(line: 100, column: 35, scope: !184)
!196 = !DILocation(line: 100, column: 9, scope: !184)
!197 = distinct !{!197, !187, !198, !69}
!198 = !DILocation(line: 103, column: 9, scope: !181)
!199 = !DILocation(line: 104, column: 9, scope: !171)
!200 = !DILocation(line: 104, column: 20, scope: !171)
!201 = !DILocation(line: 105, column: 19, scope: !171)
!202 = !DILocation(line: 105, column: 9, scope: !171)
!203 = !DILocation(line: 107, column: 1, scope: !152)
