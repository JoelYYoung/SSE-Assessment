; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad() #0 !dbg !13 {
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
  %call = call i32 (...) @globalReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %2, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !48
  store i64 %call1, i64* %sourceLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !53
  %6 = load i64, i64* %sourceLen, align 8, !dbg !55
  %add = add i64 %6, 1, !dbg !56
  %cmp = icmp ult i64 %5, %add, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !61
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !61
  %9 = load i8*, i8** %data, align 8, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !62
  store i8 %8, i8* %arrayidx3, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %11, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %12), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_good() #0 !dbg !74 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad(), !dbg !94
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
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 10, align 16, !dbg !102
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %1 = alloca i8, i64 11, align 16, !dbg !105
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !104
  %call = call i32 (...) @globalReturnsFalse(), !dbg !106
  %tobool = icmp ne i32 %call, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !112
  store i8* %2, i8** %data, align 8, !dbg !114
  %3 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !124
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !125
  store i64 %call1, i64* %sourceLen, align 8, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !130
  %6 = load i64, i64* %sourceLen, align 8, !dbg !132
  %add = add i64 %6, 1, !dbg !133
  %cmp = icmp ult i64 %5, %add, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !138
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !138
  %9 = load i8*, i8** %data, align 8, !dbg !139
  %10 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !139
  store i8 %8, i8* %arrayidx3, align 1, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %11, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !147
  call void @printLine(i8* %12), !dbg !148
  ret void, !dbg !149
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = alloca i8, i64 10, align 16, !dbg !155
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %1 = alloca i8, i64 11, align 16, !dbg !158
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !157
  %call = call i32 (...) @globalReturnsTrue(), !dbg !159
  %tobool = icmp ne i32 %call, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !162
  store i8* %2, i8** %data, align 8, !dbg !164
  %3 = load i8*, i8** %data, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !168, metadata !DIExpression()), !dbg !170
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !170
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !173, metadata !DIExpression()), !dbg !174
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !175
  %call1 = call i64 @strlen(i8* %arraydecay) #6, !dbg !176
  store i64 %call1, i64* %sourceLen, align 8, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !181
  %6 = load i64, i64* %sourceLen, align 8, !dbg !183
  %add = add i64 %6, 1, !dbg !184
  %cmp = icmp ult i64 %5, %add, !dbg !185
  br i1 %cmp, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !189
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !189
  %9 = load i8*, i8** %data, align 8, !dbg !190
  %10 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !190
  store i8 %8, i8* %arrayidx3, align 1, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !194
  %inc = add i64 %11, 1, !dbg !194
  store i64 %inc, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !198
  call void @printLine(i8* %12), !dbg !199
  ret void, !dbg !200
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11.c", directory: "/root/SSE-Assessment")
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
!27 = !DILocation(line: 33, column: 8, scope: !13)
!28 = !DILocation(line: 37, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 34, column: 5)
!30 = !DILocation(line: 37, column: 14, scope: !29)
!31 = !DILocation(line: 38, column: 9, scope: !29)
!32 = !DILocation(line: 38, column: 17, scope: !29)
!33 = !DILocation(line: 39, column: 5, scope: !29)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 41, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 41, column: 14, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 42, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 42, column: 16, scope: !35)
!45 = !DILocalVariable(name: "sourceLen", scope: !35, file: !14, line: 42, type: !41)
!46 = !DILocation(line: 42, column: 19, scope: !35)
!47 = !DILocation(line: 43, column: 28, scope: !35)
!48 = !DILocation(line: 43, column: 21, scope: !35)
!49 = !DILocation(line: 43, column: 19, scope: !35)
!50 = !DILocation(line: 46, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !35, file: !14, line: 46, column: 9)
!52 = !DILocation(line: 46, column: 14, scope: !51)
!53 = !DILocation(line: 46, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !14, line: 46, column: 9)
!55 = !DILocation(line: 46, column: 25, scope: !54)
!56 = !DILocation(line: 46, column: 35, scope: !54)
!57 = !DILocation(line: 46, column: 23, scope: !54)
!58 = !DILocation(line: 46, column: 9, scope: !51)
!59 = !DILocation(line: 48, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !14, line: 47, column: 9)
!61 = !DILocation(line: 48, column: 23, scope: !60)
!62 = !DILocation(line: 48, column: 13, scope: !60)
!63 = !DILocation(line: 48, column: 18, scope: !60)
!64 = !DILocation(line: 48, column: 21, scope: !60)
!65 = !DILocation(line: 49, column: 9, scope: !60)
!66 = !DILocation(line: 46, column: 41, scope: !54)
!67 = !DILocation(line: 46, column: 9, scope: !54)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 49, column: 9, scope: !51)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 50, column: 19, scope: !35)
!72 = !DILocation(line: 50, column: 9, scope: !35)
!73 = !DILocation(line: 52, column: 1, scope: !13)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_good", scope: !14, file: !14, line: 117, type: !15, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 119, column: 5, scope: !74)
!76 = !DILocation(line: 120, column: 5, scope: !74)
!77 = !DILocation(line: 121, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 133, type: !79, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !14, line: 133, type: !81)
!84 = !DILocation(line: 133, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !14, line: 133, type: !82)
!86 = !DILocation(line: 133, column: 27, scope: !78)
!87 = !DILocation(line: 136, column: 22, scope: !78)
!88 = !DILocation(line: 136, column: 12, scope: !78)
!89 = !DILocation(line: 136, column: 5, scope: !78)
!90 = !DILocation(line: 138, column: 5, scope: !78)
!91 = !DILocation(line: 139, column: 5, scope: !78)
!92 = !DILocation(line: 140, column: 5, scope: !78)
!93 = !DILocation(line: 143, column: 5, scope: !78)
!94 = !DILocation(line: 144, column: 5, scope: !78)
!95 = !DILocation(line: 145, column: 5, scope: !78)
!96 = !DILocation(line: 147, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 61, type: !4)
!99 = !DILocation(line: 61, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !14, line: 62, type: !4)
!101 = !DILocation(line: 62, column: 12, scope: !97)
!102 = !DILocation(line: 62, column: 36, scope: !97)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !14, line: 63, type: !4)
!104 = !DILocation(line: 63, column: 12, scope: !97)
!105 = !DILocation(line: 63, column: 37, scope: !97)
!106 = !DILocation(line: 64, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !97, file: !14, line: 64, column: 8)
!108 = !DILocation(line: 64, column: 8, scope: !97)
!109 = !DILocation(line: 67, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !14, line: 65, column: 5)
!111 = !DILocation(line: 68, column: 5, scope: !110)
!112 = !DILocation(line: 73, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !14, line: 70, column: 5)
!114 = !DILocation(line: 73, column: 14, scope: !113)
!115 = !DILocation(line: 74, column: 9, scope: !113)
!116 = !DILocation(line: 74, column: 17, scope: !113)
!117 = !DILocalVariable(name: "source", scope: !118, file: !14, line: 77, type: !36)
!118 = distinct !DILexicalBlock(scope: !97, file: !14, line: 76, column: 5)
!119 = !DILocation(line: 77, column: 14, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !118, file: !14, line: 78, type: !41)
!121 = !DILocation(line: 78, column: 16, scope: !118)
!122 = !DILocalVariable(name: "sourceLen", scope: !118, file: !14, line: 78, type: !41)
!123 = !DILocation(line: 78, column: 19, scope: !118)
!124 = !DILocation(line: 79, column: 28, scope: !118)
!125 = !DILocation(line: 79, column: 21, scope: !118)
!126 = !DILocation(line: 79, column: 19, scope: !118)
!127 = !DILocation(line: 82, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !118, file: !14, line: 82, column: 9)
!129 = !DILocation(line: 82, column: 14, scope: !128)
!130 = !DILocation(line: 82, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !14, line: 82, column: 9)
!132 = !DILocation(line: 82, column: 25, scope: !131)
!133 = !DILocation(line: 82, column: 35, scope: !131)
!134 = !DILocation(line: 82, column: 23, scope: !131)
!135 = !DILocation(line: 82, column: 9, scope: !128)
!136 = !DILocation(line: 84, column: 30, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !14, line: 83, column: 9)
!138 = !DILocation(line: 84, column: 23, scope: !137)
!139 = !DILocation(line: 84, column: 13, scope: !137)
!140 = !DILocation(line: 84, column: 18, scope: !137)
!141 = !DILocation(line: 84, column: 21, scope: !137)
!142 = !DILocation(line: 85, column: 9, scope: !137)
!143 = !DILocation(line: 82, column: 41, scope: !131)
!144 = !DILocation(line: 82, column: 9, scope: !131)
!145 = distinct !{!145, !135, !146, !70}
!146 = !DILocation(line: 85, column: 9, scope: !128)
!147 = !DILocation(line: 86, column: 19, scope: !118)
!148 = !DILocation(line: 86, column: 9, scope: !118)
!149 = !DILocation(line: 88, column: 1, scope: !97)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocalVariable(name: "data", scope: !150, file: !14, line: 93, type: !4)
!152 = !DILocation(line: 93, column: 12, scope: !150)
!153 = !DILocalVariable(name: "dataBadBuffer", scope: !150, file: !14, line: 94, type: !4)
!154 = !DILocation(line: 94, column: 12, scope: !150)
!155 = !DILocation(line: 94, column: 36, scope: !150)
!156 = !DILocalVariable(name: "dataGoodBuffer", scope: !150, file: !14, line: 95, type: !4)
!157 = !DILocation(line: 95, column: 12, scope: !150)
!158 = !DILocation(line: 95, column: 37, scope: !150)
!159 = !DILocation(line: 96, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !150, file: !14, line: 96, column: 8)
!161 = !DILocation(line: 96, column: 8, scope: !150)
!162 = !DILocation(line: 100, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !14, line: 97, column: 5)
!164 = !DILocation(line: 100, column: 14, scope: !163)
!165 = !DILocation(line: 101, column: 9, scope: !163)
!166 = !DILocation(line: 101, column: 17, scope: !163)
!167 = !DILocation(line: 102, column: 5, scope: !163)
!168 = !DILocalVariable(name: "source", scope: !169, file: !14, line: 104, type: !36)
!169 = distinct !DILexicalBlock(scope: !150, file: !14, line: 103, column: 5)
!170 = !DILocation(line: 104, column: 14, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !169, file: !14, line: 105, type: !41)
!172 = !DILocation(line: 105, column: 16, scope: !169)
!173 = !DILocalVariable(name: "sourceLen", scope: !169, file: !14, line: 105, type: !41)
!174 = !DILocation(line: 105, column: 19, scope: !169)
!175 = !DILocation(line: 106, column: 28, scope: !169)
!176 = !DILocation(line: 106, column: 21, scope: !169)
!177 = !DILocation(line: 106, column: 19, scope: !169)
!178 = !DILocation(line: 109, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !169, file: !14, line: 109, column: 9)
!180 = !DILocation(line: 109, column: 14, scope: !179)
!181 = !DILocation(line: 109, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !14, line: 109, column: 9)
!183 = !DILocation(line: 109, column: 25, scope: !182)
!184 = !DILocation(line: 109, column: 35, scope: !182)
!185 = !DILocation(line: 109, column: 23, scope: !182)
!186 = !DILocation(line: 109, column: 9, scope: !179)
!187 = !DILocation(line: 111, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !182, file: !14, line: 110, column: 9)
!189 = !DILocation(line: 111, column: 23, scope: !188)
!190 = !DILocation(line: 111, column: 13, scope: !188)
!191 = !DILocation(line: 111, column: 18, scope: !188)
!192 = !DILocation(line: 111, column: 21, scope: !188)
!193 = !DILocation(line: 112, column: 9, scope: !188)
!194 = !DILocation(line: 109, column: 41, scope: !182)
!195 = !DILocation(line: 109, column: 9, scope: !182)
!196 = distinct !{!196, !186, !197, !70}
!197 = !DILocation(line: 112, column: 9, scope: !179)
!198 = !DILocation(line: 113, column: 19, scope: !169)
!199 = !DILocation(line: 113, column: 9, scope: !169)
!200 = !DILocation(line: 115, column: 1, scope: !150)
