; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !25
  %cmp = icmp eq i32 %2, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !29
  store i8* %3, i8** %data, align 8, !dbg !31
  %4 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !49
  store i64 %call, i64* %sourceLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !54
  %7 = load i64, i64* %sourceLen, align 8, !dbg !56
  %add = add i64 %7, 1, !dbg !57
  %cmp1 = icmp ult i64 %6, %add, !dbg !58
  br i1 %cmp1, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !62
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !62
  %10 = load i8*, i8** %data, align 8, !dbg !63
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !63
  store i8 %9, i8* %arrayidx3, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %12, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* %13), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13_good() #0 !dbg !75 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13_bad(), !dbg !95
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
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 10, align 16, !dbg !103
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %1 = alloca i8, i64 11, align 16, !dbg !106
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !105
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !107
  %cmp = icmp ne i32 %2, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !114
  store i8* %3, i8** %data, align 8, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !126
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !127
  store i64 %call, i64* %sourceLen, align 8, !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !132
  %7 = load i64, i64* %sourceLen, align 8, !dbg !134
  %add = add i64 %7, 1, !dbg !135
  %cmp1 = icmp ult i64 %6, %add, !dbg !136
  br i1 %cmp1, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !140
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !140
  %10 = load i8*, i8** %data, align 8, !dbg !141
  %11 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !141
  store i8 %9, i8* %arrayidx3, align 1, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %12, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !149
  call void @printLine(i8* %13), !dbg !150
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !152 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %0 = alloca i8, i64 10, align 16, !dbg !157
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %1 = alloca i8, i64 11, align 16, !dbg !160
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !159
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !161
  %cmp = icmp eq i32 %2, 5, !dbg !163
  br i1 %cmp, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !165
  store i8* %3, i8** %data, align 8, !dbg !167
  %4 = load i8*, i8** %data, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  br label %if.end, !dbg !170

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !171, metadata !DIExpression()), !dbg !173
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !173
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !173
  call void @llvm.dbg.declare(metadata i64* %i, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !176, metadata !DIExpression()), !dbg !177
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !178
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !179
  store i64 %call, i64* %sourceLen, align 8, !dbg !180
  store i64 0, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !184
  %7 = load i64, i64* %sourceLen, align 8, !dbg !186
  %add = add i64 %7, 1, !dbg !187
  %cmp1 = icmp ult i64 %6, %add, !dbg !188
  br i1 %cmp1, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !192
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !192
  %10 = load i8*, i8** %data, align 8, !dbg !193
  %11 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !193
  store i8 %9, i8* %arrayidx3, align 1, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %12, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !201
  call void @printLine(i8* %13), !dbg !202
  ret void, !dbg !203
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 25, scope: !26)
!28 = !DILocation(line: 33, column: 8, scope: !13)
!29 = !DILocation(line: 37, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !14, line: 34, column: 5)
!31 = !DILocation(line: 37, column: 14, scope: !30)
!32 = !DILocation(line: 38, column: 9, scope: !30)
!33 = !DILocation(line: 38, column: 17, scope: !30)
!34 = !DILocation(line: 39, column: 5, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 41, column: 14, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 42, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 42, column: 16, scope: !36)
!46 = !DILocalVariable(name: "sourceLen", scope: !36, file: !14, line: 42, type: !42)
!47 = !DILocation(line: 42, column: 19, scope: !36)
!48 = !DILocation(line: 43, column: 28, scope: !36)
!49 = !DILocation(line: 43, column: 21, scope: !36)
!50 = !DILocation(line: 43, column: 19, scope: !36)
!51 = !DILocation(line: 46, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !36, file: !14, line: 46, column: 9)
!53 = !DILocation(line: 46, column: 14, scope: !52)
!54 = !DILocation(line: 46, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !14, line: 46, column: 9)
!56 = !DILocation(line: 46, column: 25, scope: !55)
!57 = !DILocation(line: 46, column: 35, scope: !55)
!58 = !DILocation(line: 46, column: 23, scope: !55)
!59 = !DILocation(line: 46, column: 9, scope: !52)
!60 = !DILocation(line: 48, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !14, line: 47, column: 9)
!62 = !DILocation(line: 48, column: 23, scope: !61)
!63 = !DILocation(line: 48, column: 13, scope: !61)
!64 = !DILocation(line: 48, column: 18, scope: !61)
!65 = !DILocation(line: 48, column: 21, scope: !61)
!66 = !DILocation(line: 49, column: 9, scope: !61)
!67 = !DILocation(line: 46, column: 41, scope: !55)
!68 = !DILocation(line: 46, column: 9, scope: !55)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 49, column: 9, scope: !52)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 50, column: 19, scope: !36)
!73 = !DILocation(line: 50, column: 9, scope: !36)
!74 = !DILocation(line: 52, column: 1, scope: !13)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_13_good", scope: !14, file: !14, line: 117, type: !15, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 119, column: 5, scope: !75)
!77 = !DILocation(line: 120, column: 5, scope: !75)
!78 = !DILocation(line: 121, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 133, type: !80, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !14, line: 133, type: !82)
!85 = !DILocation(line: 133, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !14, line: 133, type: !83)
!87 = !DILocation(line: 133, column: 27, scope: !79)
!88 = !DILocation(line: 136, column: 22, scope: !79)
!89 = !DILocation(line: 136, column: 12, scope: !79)
!90 = !DILocation(line: 136, column: 5, scope: !79)
!91 = !DILocation(line: 138, column: 5, scope: !79)
!92 = !DILocation(line: 139, column: 5, scope: !79)
!93 = !DILocation(line: 140, column: 5, scope: !79)
!94 = !DILocation(line: 143, column: 5, scope: !79)
!95 = !DILocation(line: 144, column: 5, scope: !79)
!96 = !DILocation(line: 145, column: 5, scope: !79)
!97 = !DILocation(line: 147, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 61, type: !4)
!100 = !DILocation(line: 61, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !14, line: 62, type: !4)
!102 = !DILocation(line: 62, column: 12, scope: !98)
!103 = !DILocation(line: 62, column: 36, scope: !98)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !14, line: 63, type: !4)
!105 = !DILocation(line: 63, column: 12, scope: !98)
!106 = !DILocation(line: 63, column: 37, scope: !98)
!107 = !DILocation(line: 64, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !98, file: !14, line: 64, column: 8)
!109 = !DILocation(line: 64, column: 25, scope: !108)
!110 = !DILocation(line: 64, column: 8, scope: !98)
!111 = !DILocation(line: 67, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !14, line: 65, column: 5)
!113 = !DILocation(line: 68, column: 5, scope: !112)
!114 = !DILocation(line: 73, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !14, line: 70, column: 5)
!116 = !DILocation(line: 73, column: 14, scope: !115)
!117 = !DILocation(line: 74, column: 9, scope: !115)
!118 = !DILocation(line: 74, column: 17, scope: !115)
!119 = !DILocalVariable(name: "source", scope: !120, file: !14, line: 77, type: !37)
!120 = distinct !DILexicalBlock(scope: !98, file: !14, line: 76, column: 5)
!121 = !DILocation(line: 77, column: 14, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !120, file: !14, line: 78, type: !42)
!123 = !DILocation(line: 78, column: 16, scope: !120)
!124 = !DILocalVariable(name: "sourceLen", scope: !120, file: !14, line: 78, type: !42)
!125 = !DILocation(line: 78, column: 19, scope: !120)
!126 = !DILocation(line: 79, column: 28, scope: !120)
!127 = !DILocation(line: 79, column: 21, scope: !120)
!128 = !DILocation(line: 79, column: 19, scope: !120)
!129 = !DILocation(line: 82, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !120, file: !14, line: 82, column: 9)
!131 = !DILocation(line: 82, column: 14, scope: !130)
!132 = !DILocation(line: 82, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !14, line: 82, column: 9)
!134 = !DILocation(line: 82, column: 25, scope: !133)
!135 = !DILocation(line: 82, column: 35, scope: !133)
!136 = !DILocation(line: 82, column: 23, scope: !133)
!137 = !DILocation(line: 82, column: 9, scope: !130)
!138 = !DILocation(line: 84, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !14, line: 83, column: 9)
!140 = !DILocation(line: 84, column: 23, scope: !139)
!141 = !DILocation(line: 84, column: 13, scope: !139)
!142 = !DILocation(line: 84, column: 18, scope: !139)
!143 = !DILocation(line: 84, column: 21, scope: !139)
!144 = !DILocation(line: 85, column: 9, scope: !139)
!145 = !DILocation(line: 82, column: 41, scope: !133)
!146 = !DILocation(line: 82, column: 9, scope: !133)
!147 = distinct !{!147, !137, !148, !71}
!148 = !DILocation(line: 85, column: 9, scope: !130)
!149 = !DILocation(line: 86, column: 19, scope: !120)
!150 = !DILocation(line: 86, column: 9, scope: !120)
!151 = !DILocation(line: 88, column: 1, scope: !98)
!152 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocalVariable(name: "data", scope: !152, file: !14, line: 93, type: !4)
!154 = !DILocation(line: 93, column: 12, scope: !152)
!155 = !DILocalVariable(name: "dataBadBuffer", scope: !152, file: !14, line: 94, type: !4)
!156 = !DILocation(line: 94, column: 12, scope: !152)
!157 = !DILocation(line: 94, column: 36, scope: !152)
!158 = !DILocalVariable(name: "dataGoodBuffer", scope: !152, file: !14, line: 95, type: !4)
!159 = !DILocation(line: 95, column: 12, scope: !152)
!160 = !DILocation(line: 95, column: 37, scope: !152)
!161 = !DILocation(line: 96, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !152, file: !14, line: 96, column: 8)
!163 = !DILocation(line: 96, column: 25, scope: !162)
!164 = !DILocation(line: 96, column: 8, scope: !152)
!165 = !DILocation(line: 100, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !14, line: 97, column: 5)
!167 = !DILocation(line: 100, column: 14, scope: !166)
!168 = !DILocation(line: 101, column: 9, scope: !166)
!169 = !DILocation(line: 101, column: 17, scope: !166)
!170 = !DILocation(line: 102, column: 5, scope: !166)
!171 = !DILocalVariable(name: "source", scope: !172, file: !14, line: 104, type: !37)
!172 = distinct !DILexicalBlock(scope: !152, file: !14, line: 103, column: 5)
!173 = !DILocation(line: 104, column: 14, scope: !172)
!174 = !DILocalVariable(name: "i", scope: !172, file: !14, line: 105, type: !42)
!175 = !DILocation(line: 105, column: 16, scope: !172)
!176 = !DILocalVariable(name: "sourceLen", scope: !172, file: !14, line: 105, type: !42)
!177 = !DILocation(line: 105, column: 19, scope: !172)
!178 = !DILocation(line: 106, column: 28, scope: !172)
!179 = !DILocation(line: 106, column: 21, scope: !172)
!180 = !DILocation(line: 106, column: 19, scope: !172)
!181 = !DILocation(line: 109, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !172, file: !14, line: 109, column: 9)
!183 = !DILocation(line: 109, column: 14, scope: !182)
!184 = !DILocation(line: 109, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !14, line: 109, column: 9)
!186 = !DILocation(line: 109, column: 25, scope: !185)
!187 = !DILocation(line: 109, column: 35, scope: !185)
!188 = !DILocation(line: 109, column: 23, scope: !185)
!189 = !DILocation(line: 109, column: 9, scope: !182)
!190 = !DILocation(line: 111, column: 30, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !14, line: 110, column: 9)
!192 = !DILocation(line: 111, column: 23, scope: !191)
!193 = !DILocation(line: 111, column: 13, scope: !191)
!194 = !DILocation(line: 111, column: 18, scope: !191)
!195 = !DILocation(line: 111, column: 21, scope: !191)
!196 = !DILocation(line: 112, column: 9, scope: !191)
!197 = !DILocation(line: 109, column: 41, scope: !185)
!198 = !DILocation(line: 109, column: 9, scope: !185)
!199 = distinct !{!199, !189, !200, !71}
!200 = !DILocation(line: 112, column: 9, scope: !182)
!201 = !DILocation(line: 113, column: 19, scope: !172)
!202 = !DILocation(line: 113, column: 9, scope: !172)
!203 = !DILocation(line: 115, column: 1, scope: !152)
