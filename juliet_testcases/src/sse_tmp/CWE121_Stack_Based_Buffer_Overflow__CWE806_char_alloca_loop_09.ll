; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_bad() #0 !dbg !13 {
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
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !24
  %tobool = icmp ne i32 %2, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !29
  %4 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %call = call i64 @strlen(i8* %6) #6, !dbg !47
  store i64 %call, i64* %dataLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !52
  %8 = load i64, i64* %dataLen, align 8, !dbg !54
  %cmp = icmp ult i64 %7, %8, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !57
  %10 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !57
  %11 = load i8, i8* %arrayidx1, align 1, !dbg !57
  %12 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !61
  store i8 %11, i8* %arrayidx2, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %13, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !69
  store i8 0, i8* %arrayidx3, align 1, !dbg !70
  %14 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %14), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #7, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #7, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 100, align 16, !dbg !102
  store i8* %0, i8** %dataBuffer, align 8, !dbg !101
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  store i8* %1, i8** %data, align 8, !dbg !104
  %2 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !105
  %tobool = icmp ne i32 %2, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !121, metadata !DIExpression()), !dbg !122
  %6 = load i8*, i8** %data, align 8, !dbg !123
  %call = call i64 @strlen(i8* %6) #6, !dbg !124
  store i64 %call, i64* %dataLen, align 8, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !129
  %8 = load i64, i64* %dataLen, align 8, !dbg !131
  %cmp = icmp ult i64 %7, %8, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !134
  %10 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !134
  %11 = load i8, i8* %arrayidx1, align 1, !dbg !134
  %12 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !138
  store i8 %11, i8* %arrayidx2, align 1, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %13, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !145
  store i8 0, i8* %arrayidx3, align 1, !dbg !146
  %14 = load i8*, i8** %data, align 8, !dbg !147
  call void @printLine(i8* %14), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = alloca i8, i64 100, align 16, !dbg !155
  store i8* %0, i8** %dataBuffer, align 8, !dbg !154
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !156
  store i8* %1, i8** %data, align 8, !dbg !157
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !158
  %tobool = icmp ne i32 %2, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !163
  %4 = load i8*, i8** %data, align 8, !dbg !164
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !164
  store i8 0, i8* %arrayidx, align 1, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !167, metadata !DIExpression()), !dbg !169
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !172, metadata !DIExpression()), !dbg !173
  %6 = load i8*, i8** %data, align 8, !dbg !174
  %call = call i64 @strlen(i8* %6) #6, !dbg !175
  store i64 %call, i64* %dataLen, align 8, !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !180
  %8 = load i64, i64* %dataLen, align 8, !dbg !182
  %cmp = icmp ult i64 %7, %8, !dbg !183
  br i1 %cmp, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !185
  %10 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx1 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !185
  %11 = load i8, i8* %arrayidx1, align 1, !dbg !185
  %12 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !189
  store i8 %11, i8* %arrayidx2, align 1, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %13, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !196
  store i8 0, i8* %arrayidx3, align 1, !dbg !197
  %14 = load i8*, i8** %data, align 8, !dbg !198
  call void @printLine(i8* %14), !dbg !199
  ret void, !dbg !200
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09.c", directory: "/root/SSE-Assessment")
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
!26 = !DILocation(line: 28, column: 8, scope: !13)
!27 = !DILocation(line: 31, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 29, column: 5)
!29 = !DILocation(line: 31, column: 9, scope: !28)
!30 = !DILocation(line: 32, column: 9, scope: !28)
!31 = !DILocation(line: 32, column: 21, scope: !28)
!32 = !DILocation(line: 33, column: 5, scope: !28)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 35, column: 14, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !14, line: 36, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 36, column: 16, scope: !34)
!44 = !DILocalVariable(name: "dataLen", scope: !34, file: !14, line: 36, type: !40)
!45 = !DILocation(line: 36, column: 19, scope: !34)
!46 = !DILocation(line: 37, column: 26, scope: !34)
!47 = !DILocation(line: 37, column: 19, scope: !34)
!48 = !DILocation(line: 37, column: 17, scope: !34)
!49 = !DILocation(line: 39, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !34, file: !14, line: 39, column: 9)
!51 = !DILocation(line: 39, column: 14, scope: !50)
!52 = !DILocation(line: 39, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !14, line: 39, column: 9)
!54 = !DILocation(line: 39, column: 25, scope: !53)
!55 = !DILocation(line: 39, column: 23, scope: !53)
!56 = !DILocation(line: 39, column: 9, scope: !50)
!57 = !DILocation(line: 41, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !14, line: 40, column: 9)
!59 = !DILocation(line: 41, column: 28, scope: !58)
!60 = !DILocation(line: 41, column: 18, scope: !58)
!61 = !DILocation(line: 41, column: 13, scope: !58)
!62 = !DILocation(line: 41, column: 21, scope: !58)
!63 = !DILocation(line: 42, column: 9, scope: !58)
!64 = !DILocation(line: 39, column: 35, scope: !53)
!65 = !DILocation(line: 39, column: 9, scope: !53)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 42, column: 9, scope: !50)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 43, column: 9, scope: !34)
!70 = !DILocation(line: 43, column: 20, scope: !34)
!71 = !DILocation(line: 44, column: 19, scope: !34)
!72 = !DILocation(line: 44, column: 9, scope: !34)
!73 = !DILocation(line: 46, column: 1, scope: !13)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_good", scope: !14, file: !14, line: 109, type: !15, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 111, column: 5, scope: !74)
!76 = !DILocation(line: 112, column: 5, scope: !74)
!77 = !DILocation(line: 113, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 125, type: !79, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !14, line: 125, type: !81)
!84 = !DILocation(line: 125, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !14, line: 125, type: !82)
!86 = !DILocation(line: 125, column: 27, scope: !78)
!87 = !DILocation(line: 128, column: 22, scope: !78)
!88 = !DILocation(line: 128, column: 12, scope: !78)
!89 = !DILocation(line: 128, column: 5, scope: !78)
!90 = !DILocation(line: 130, column: 5, scope: !78)
!91 = !DILocation(line: 131, column: 5, scope: !78)
!92 = !DILocation(line: 132, column: 5, scope: !78)
!93 = !DILocation(line: 135, column: 5, scope: !78)
!94 = !DILocation(line: 136, column: 5, scope: !78)
!95 = !DILocation(line: 137, column: 5, scope: !78)
!96 = !DILocation(line: 139, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 55, type: !4)
!99 = !DILocation(line: 55, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !14, line: 56, type: !4)
!101 = !DILocation(line: 56, column: 12, scope: !97)
!102 = !DILocation(line: 56, column: 33, scope: !97)
!103 = !DILocation(line: 57, column: 12, scope: !97)
!104 = !DILocation(line: 57, column: 10, scope: !97)
!105 = !DILocation(line: 58, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !97, file: !14, line: 58, column: 8)
!107 = !DILocation(line: 58, column: 8, scope: !97)
!108 = !DILocation(line: 61, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !14, line: 59, column: 5)
!110 = !DILocation(line: 62, column: 5, scope: !109)
!111 = !DILocation(line: 66, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !14, line: 64, column: 5)
!113 = !DILocation(line: 66, column: 9, scope: !112)
!114 = !DILocation(line: 67, column: 9, scope: !112)
!115 = !DILocation(line: 67, column: 20, scope: !112)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !14, line: 70, type: !35)
!117 = distinct !DILexicalBlock(scope: !97, file: !14, line: 69, column: 5)
!118 = !DILocation(line: 70, column: 14, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !117, file: !14, line: 71, type: !40)
!120 = !DILocation(line: 71, column: 16, scope: !117)
!121 = !DILocalVariable(name: "dataLen", scope: !117, file: !14, line: 71, type: !40)
!122 = !DILocation(line: 71, column: 19, scope: !117)
!123 = !DILocation(line: 72, column: 26, scope: !117)
!124 = !DILocation(line: 72, column: 19, scope: !117)
!125 = !DILocation(line: 72, column: 17, scope: !117)
!126 = !DILocation(line: 74, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !117, file: !14, line: 74, column: 9)
!128 = !DILocation(line: 74, column: 14, scope: !127)
!129 = !DILocation(line: 74, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !14, line: 74, column: 9)
!131 = !DILocation(line: 74, column: 25, scope: !130)
!132 = !DILocation(line: 74, column: 23, scope: !130)
!133 = !DILocation(line: 74, column: 9, scope: !127)
!134 = !DILocation(line: 76, column: 23, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !14, line: 75, column: 9)
!136 = !DILocation(line: 76, column: 28, scope: !135)
!137 = !DILocation(line: 76, column: 18, scope: !135)
!138 = !DILocation(line: 76, column: 13, scope: !135)
!139 = !DILocation(line: 76, column: 21, scope: !135)
!140 = !DILocation(line: 77, column: 9, scope: !135)
!141 = !DILocation(line: 74, column: 35, scope: !130)
!142 = !DILocation(line: 74, column: 9, scope: !130)
!143 = distinct !{!143, !133, !144, !68}
!144 = !DILocation(line: 77, column: 9, scope: !127)
!145 = !DILocation(line: 78, column: 9, scope: !117)
!146 = !DILocation(line: 78, column: 20, scope: !117)
!147 = !DILocation(line: 79, column: 19, scope: !117)
!148 = !DILocation(line: 79, column: 9, scope: !117)
!149 = !DILocation(line: 81, column: 1, scope: !97)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocalVariable(name: "data", scope: !150, file: !14, line: 86, type: !4)
!152 = !DILocation(line: 86, column: 12, scope: !150)
!153 = !DILocalVariable(name: "dataBuffer", scope: !150, file: !14, line: 87, type: !4)
!154 = !DILocation(line: 87, column: 12, scope: !150)
!155 = !DILocation(line: 87, column: 33, scope: !150)
!156 = !DILocation(line: 88, column: 12, scope: !150)
!157 = !DILocation(line: 88, column: 10, scope: !150)
!158 = !DILocation(line: 89, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !150, file: !14, line: 89, column: 8)
!160 = !DILocation(line: 89, column: 8, scope: !150)
!161 = !DILocation(line: 92, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !14, line: 90, column: 5)
!163 = !DILocation(line: 92, column: 9, scope: !162)
!164 = !DILocation(line: 93, column: 9, scope: !162)
!165 = !DILocation(line: 93, column: 20, scope: !162)
!166 = !DILocation(line: 94, column: 5, scope: !162)
!167 = !DILocalVariable(name: "dest", scope: !168, file: !14, line: 96, type: !35)
!168 = distinct !DILexicalBlock(scope: !150, file: !14, line: 95, column: 5)
!169 = !DILocation(line: 96, column: 14, scope: !168)
!170 = !DILocalVariable(name: "i", scope: !168, file: !14, line: 97, type: !40)
!171 = !DILocation(line: 97, column: 16, scope: !168)
!172 = !DILocalVariable(name: "dataLen", scope: !168, file: !14, line: 97, type: !40)
!173 = !DILocation(line: 97, column: 19, scope: !168)
!174 = !DILocation(line: 98, column: 26, scope: !168)
!175 = !DILocation(line: 98, column: 19, scope: !168)
!176 = !DILocation(line: 98, column: 17, scope: !168)
!177 = !DILocation(line: 100, column: 16, scope: !178)
!178 = distinct !DILexicalBlock(scope: !168, file: !14, line: 100, column: 9)
!179 = !DILocation(line: 100, column: 14, scope: !178)
!180 = !DILocation(line: 100, column: 21, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !14, line: 100, column: 9)
!182 = !DILocation(line: 100, column: 25, scope: !181)
!183 = !DILocation(line: 100, column: 23, scope: !181)
!184 = !DILocation(line: 100, column: 9, scope: !178)
!185 = !DILocation(line: 102, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !181, file: !14, line: 101, column: 9)
!187 = !DILocation(line: 102, column: 28, scope: !186)
!188 = !DILocation(line: 102, column: 18, scope: !186)
!189 = !DILocation(line: 102, column: 13, scope: !186)
!190 = !DILocation(line: 102, column: 21, scope: !186)
!191 = !DILocation(line: 103, column: 9, scope: !186)
!192 = !DILocation(line: 100, column: 35, scope: !181)
!193 = !DILocation(line: 100, column: 9, scope: !181)
!194 = distinct !{!194, !184, !195, !68}
!195 = !DILocation(line: 103, column: 9, scope: !178)
!196 = !DILocation(line: 104, column: 9, scope: !168)
!197 = !DILocation(line: 104, column: 20, scope: !168)
!198 = !DILocation(line: 105, column: 19, scope: !168)
!199 = !DILocation(line: 105, column: 9, scope: !168)
!200 = !DILocation(line: 107, column: 1, scope: !150)
