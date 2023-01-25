; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_11.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx4, align 1, !dbg !53
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !55
  store i64 %call6, i64* %destLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !60
  %4 = load i64, i64* %destLen, align 8, !dbg !62
  %cmp7 = icmp ult i64 %3, %4, !dbg !63
  br i1 %cmp7, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !65
  %6 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx8 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !65
  %7 = load i8, i8* %arrayidx8, align 1, !dbg !65
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !69
  store i8 %7, i8* %arrayidx9, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %9, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !77
  store i8 0, i8* %arrayidx10, align 1, !dbg !78
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !79
  call void @printLine(i8* %arraydecay11), !dbg !80
  %10 = load i8*, i8** %data, align 8, !dbg !81
  call void @free(i8* %10) #7, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_11_good() #0 !dbg !84 {
entry:
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__malloc_char_loop_11_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__malloc_char_loop_11_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i8* null, i8** %data, align 8, !dbg !110
  %call = call i32 (...) @globalReturnsFalse(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end3, !dbg !116

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !117
  store i8* %call1, i8** %data, align 8, !dbg !119
  %0 = load i8*, i8** %data, align 8, !dbg !120
  %cmp = icmp eq i8* %0, null, !dbg !122
  br i1 %cmp, label %if.then2, label %if.end, !dbg !123

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %data, align 8, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !127
  %2 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !137
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !138
  store i8 0, i8* %arrayidx4, align 1, !dbg !139
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !141
  store i64 %call6, i64* %destLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !146
  %4 = load i64, i64* %destLen, align 8, !dbg !148
  %cmp7 = icmp ult i64 %3, %4, !dbg !149
  br i1 %cmp7, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !151
  %6 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx8 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !151
  %7 = load i8, i8* %arrayidx8, align 1, !dbg !151
  %8 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !155
  store i8 %7, i8* %arrayidx9, align 1, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %9, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !162
  store i8 0, i8* %arrayidx10, align 1, !dbg !163
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !164
  call void @printLine(i8* %arraydecay11), !dbg !165
  %10 = load i8*, i8** %data, align 8, !dbg !166
  call void @free(i8* %10) #7, !dbg !167
  ret void, !dbg !168
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !169 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !170, metadata !DIExpression()), !dbg !171
  store i8* null, i8** %data, align 8, !dbg !172
  %call = call i32 (...) @globalReturnsTrue(), !dbg !173
  %tobool = icmp ne i32 %call, 0, !dbg !173
  br i1 %tobool, label %if.then, label %if.end3, !dbg !175

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !176
  store i8* %call1, i8** %data, align 8, !dbg !178
  %0 = load i8*, i8** %data, align 8, !dbg !179
  %cmp = icmp eq i8* %0, null, !dbg !181
  br i1 %cmp, label %if.then2, label %if.end, !dbg !182

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !183
  unreachable, !dbg !183

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !185
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !186
  %2 = load i8*, i8** %data, align 8, !dbg !187
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !187
  store i8 0, i8* %arrayidx, align 1, !dbg !188
  br label %if.end3, !dbg !189

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !190, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !193, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !195, metadata !DIExpression()), !dbg !196
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !197
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !197
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !198
  store i8 0, i8* %arrayidx4, align 1, !dbg !199
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !200
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !201
  store i64 %call6, i64* %destLen, align 8, !dbg !202
  store i64 0, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !205

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !206
  %4 = load i64, i64* %destLen, align 8, !dbg !208
  %cmp7 = icmp ult i64 %3, %4, !dbg !209
  br i1 %cmp7, label %for.body, label %for.end, !dbg !210

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !211
  %6 = load i64, i64* %i, align 8, !dbg !213
  %arrayidx8 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !211
  %7 = load i8, i8* %arrayidx8, align 1, !dbg !211
  %8 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !215
  store i8 %7, i8* %arrayidx9, align 1, !dbg !216
  br label %for.inc, !dbg !217

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !218
  %inc = add i64 %9, 1, !dbg !218
  store i64 %inc, i64* %i, align 8, !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !222
  store i8 0, i8* %arrayidx10, align 1, !dbg !223
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !224
  call void @printLine(i8* %arraydecay11), !dbg !225
  %10 = load i8*, i8** %data, align 8, !dbg !226
  call void @free(i8* %10) #7, !dbg !227
  ret void, !dbg !228
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_11_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 14, scope: !25)
!27 = !DILocation(line: 31, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!29 = !DILocation(line: 31, column: 18, scope: !28)
!30 = !DILocation(line: 31, column: 13, scope: !25)
!31 = !DILocation(line: 31, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 27)
!33 = !DILocation(line: 32, column: 16, scope: !25)
!34 = !DILocation(line: 32, column: 9, scope: !25)
!35 = !DILocation(line: 33, column: 9, scope: !25)
!36 = !DILocation(line: 33, column: 20, scope: !25)
!37 = !DILocation(line: 34, column: 5, scope: !25)
!38 = !DILocalVariable(name: "i", scope: !39, file: !15, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 36, column: 16, scope: !39)
!44 = !DILocalVariable(name: "destLen", scope: !39, file: !15, line: 36, type: !40)
!45 = !DILocation(line: 36, column: 19, scope: !39)
!46 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 37, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 37, column: 14, scope: !39)
!51 = !DILocation(line: 38, column: 9, scope: !39)
!52 = !DILocation(line: 39, column: 9, scope: !39)
!53 = !DILocation(line: 39, column: 21, scope: !39)
!54 = !DILocation(line: 40, column: 26, scope: !39)
!55 = !DILocation(line: 40, column: 19, scope: !39)
!56 = !DILocation(line: 40, column: 17, scope: !39)
!57 = !DILocation(line: 43, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !39, file: !15, line: 43, column: 9)
!59 = !DILocation(line: 43, column: 14, scope: !58)
!60 = !DILocation(line: 43, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !15, line: 43, column: 9)
!62 = !DILocation(line: 43, column: 25, scope: !61)
!63 = !DILocation(line: 43, column: 23, scope: !61)
!64 = !DILocation(line: 43, column: 9, scope: !58)
!65 = !DILocation(line: 45, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !15, line: 44, column: 9)
!67 = !DILocation(line: 45, column: 28, scope: !66)
!68 = !DILocation(line: 45, column: 18, scope: !66)
!69 = !DILocation(line: 45, column: 13, scope: !66)
!70 = !DILocation(line: 45, column: 21, scope: !66)
!71 = !DILocation(line: 46, column: 9, scope: !66)
!72 = !DILocation(line: 43, column: 35, scope: !61)
!73 = !DILocation(line: 43, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 46, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 47, column: 9, scope: !39)
!78 = !DILocation(line: 47, column: 21, scope: !39)
!79 = !DILocation(line: 48, column: 19, scope: !39)
!80 = !DILocation(line: 48, column: 9, scope: !39)
!81 = !DILocation(line: 49, column: 14, scope: !39)
!82 = !DILocation(line: 49, column: 9, scope: !39)
!83 = !DILocation(line: 51, column: 1, scope: !14)
!84 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_11_good", scope: !15, file: !15, line: 124, type: !16, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 126, column: 5, scope: !84)
!86 = !DILocation(line: 127, column: 5, scope: !84)
!87 = !DILocation(line: 128, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 140, type: !89, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 140, type: !91)
!94 = !DILocation(line: 140, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 140, type: !92)
!96 = !DILocation(line: 140, column: 27, scope: !88)
!97 = !DILocation(line: 143, column: 22, scope: !88)
!98 = !DILocation(line: 143, column: 12, scope: !88)
!99 = !DILocation(line: 143, column: 5, scope: !88)
!100 = !DILocation(line: 145, column: 5, scope: !88)
!101 = !DILocation(line: 146, column: 5, scope: !88)
!102 = !DILocation(line: 147, column: 5, scope: !88)
!103 = !DILocation(line: 150, column: 5, scope: !88)
!104 = !DILocation(line: 151, column: 5, scope: !88)
!105 = !DILocation(line: 152, column: 5, scope: !88)
!106 = !DILocation(line: 154, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 60, type: !4)
!109 = !DILocation(line: 60, column: 12, scope: !107)
!110 = !DILocation(line: 61, column: 10, scope: !107)
!111 = !DILocation(line: 62, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !15, line: 62, column: 8)
!113 = !DILocation(line: 62, column: 8, scope: !107)
!114 = !DILocation(line: 65, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 63, column: 5)
!116 = !DILocation(line: 66, column: 5, scope: !115)
!117 = !DILocation(line: 70, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !15, line: 68, column: 5)
!119 = !DILocation(line: 70, column: 14, scope: !118)
!120 = !DILocation(line: 71, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !15, line: 71, column: 13)
!122 = !DILocation(line: 71, column: 18, scope: !121)
!123 = !DILocation(line: 71, column: 13, scope: !118)
!124 = !DILocation(line: 71, column: 28, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 71, column: 27)
!126 = !DILocation(line: 72, column: 16, scope: !118)
!127 = !DILocation(line: 72, column: 9, scope: !118)
!128 = !DILocation(line: 73, column: 9, scope: !118)
!129 = !DILocation(line: 73, column: 21, scope: !118)
!130 = !DILocalVariable(name: "i", scope: !131, file: !15, line: 76, type: !40)
!131 = distinct !DILexicalBlock(scope: !107, file: !15, line: 75, column: 5)
!132 = !DILocation(line: 76, column: 16, scope: !131)
!133 = !DILocalVariable(name: "destLen", scope: !131, file: !15, line: 76, type: !40)
!134 = !DILocation(line: 76, column: 19, scope: !131)
!135 = !DILocalVariable(name: "dest", scope: !131, file: !15, line: 77, type: !47)
!136 = !DILocation(line: 77, column: 14, scope: !131)
!137 = !DILocation(line: 78, column: 9, scope: !131)
!138 = !DILocation(line: 79, column: 9, scope: !131)
!139 = !DILocation(line: 79, column: 21, scope: !131)
!140 = !DILocation(line: 80, column: 26, scope: !131)
!141 = !DILocation(line: 80, column: 19, scope: !131)
!142 = !DILocation(line: 80, column: 17, scope: !131)
!143 = !DILocation(line: 83, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !131, file: !15, line: 83, column: 9)
!145 = !DILocation(line: 83, column: 14, scope: !144)
!146 = !DILocation(line: 83, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !15, line: 83, column: 9)
!148 = !DILocation(line: 83, column: 25, scope: !147)
!149 = !DILocation(line: 83, column: 23, scope: !147)
!150 = !DILocation(line: 83, column: 9, scope: !144)
!151 = !DILocation(line: 85, column: 23, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !15, line: 84, column: 9)
!153 = !DILocation(line: 85, column: 28, scope: !152)
!154 = !DILocation(line: 85, column: 18, scope: !152)
!155 = !DILocation(line: 85, column: 13, scope: !152)
!156 = !DILocation(line: 85, column: 21, scope: !152)
!157 = !DILocation(line: 86, column: 9, scope: !152)
!158 = !DILocation(line: 83, column: 35, scope: !147)
!159 = !DILocation(line: 83, column: 9, scope: !147)
!160 = distinct !{!160, !150, !161, !76}
!161 = !DILocation(line: 86, column: 9, scope: !144)
!162 = !DILocation(line: 87, column: 9, scope: !131)
!163 = !DILocation(line: 87, column: 21, scope: !131)
!164 = !DILocation(line: 88, column: 19, scope: !131)
!165 = !DILocation(line: 88, column: 9, scope: !131)
!166 = !DILocation(line: 89, column: 14, scope: !131)
!167 = !DILocation(line: 89, column: 9, scope: !131)
!168 = !DILocation(line: 91, column: 1, scope: !107)
!169 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!170 = !DILocalVariable(name: "data", scope: !169, file: !15, line: 96, type: !4)
!171 = !DILocation(line: 96, column: 12, scope: !169)
!172 = !DILocation(line: 97, column: 10, scope: !169)
!173 = !DILocation(line: 98, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !169, file: !15, line: 98, column: 8)
!175 = !DILocation(line: 98, column: 8, scope: !169)
!176 = !DILocation(line: 101, column: 24, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !15, line: 99, column: 5)
!178 = !DILocation(line: 101, column: 14, scope: !177)
!179 = !DILocation(line: 102, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !15, line: 102, column: 13)
!181 = !DILocation(line: 102, column: 18, scope: !180)
!182 = !DILocation(line: 102, column: 13, scope: !177)
!183 = !DILocation(line: 102, column: 28, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !15, line: 102, column: 27)
!185 = !DILocation(line: 103, column: 16, scope: !177)
!186 = !DILocation(line: 103, column: 9, scope: !177)
!187 = !DILocation(line: 104, column: 9, scope: !177)
!188 = !DILocation(line: 104, column: 21, scope: !177)
!189 = !DILocation(line: 105, column: 5, scope: !177)
!190 = !DILocalVariable(name: "i", scope: !191, file: !15, line: 107, type: !40)
!191 = distinct !DILexicalBlock(scope: !169, file: !15, line: 106, column: 5)
!192 = !DILocation(line: 107, column: 16, scope: !191)
!193 = !DILocalVariable(name: "destLen", scope: !191, file: !15, line: 107, type: !40)
!194 = !DILocation(line: 107, column: 19, scope: !191)
!195 = !DILocalVariable(name: "dest", scope: !191, file: !15, line: 108, type: !47)
!196 = !DILocation(line: 108, column: 14, scope: !191)
!197 = !DILocation(line: 109, column: 9, scope: !191)
!198 = !DILocation(line: 110, column: 9, scope: !191)
!199 = !DILocation(line: 110, column: 21, scope: !191)
!200 = !DILocation(line: 111, column: 26, scope: !191)
!201 = !DILocation(line: 111, column: 19, scope: !191)
!202 = !DILocation(line: 111, column: 17, scope: !191)
!203 = !DILocation(line: 114, column: 16, scope: !204)
!204 = distinct !DILexicalBlock(scope: !191, file: !15, line: 114, column: 9)
!205 = !DILocation(line: 114, column: 14, scope: !204)
!206 = !DILocation(line: 114, column: 21, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !15, line: 114, column: 9)
!208 = !DILocation(line: 114, column: 25, scope: !207)
!209 = !DILocation(line: 114, column: 23, scope: !207)
!210 = !DILocation(line: 114, column: 9, scope: !204)
!211 = !DILocation(line: 116, column: 23, scope: !212)
!212 = distinct !DILexicalBlock(scope: !207, file: !15, line: 115, column: 9)
!213 = !DILocation(line: 116, column: 28, scope: !212)
!214 = !DILocation(line: 116, column: 18, scope: !212)
!215 = !DILocation(line: 116, column: 13, scope: !212)
!216 = !DILocation(line: 116, column: 21, scope: !212)
!217 = !DILocation(line: 117, column: 9, scope: !212)
!218 = !DILocation(line: 114, column: 35, scope: !207)
!219 = !DILocation(line: 114, column: 9, scope: !207)
!220 = distinct !{!220, !210, !221, !76}
!221 = !DILocation(line: 117, column: 9, scope: !204)
!222 = !DILocation(line: 118, column: 9, scope: !191)
!223 = !DILocation(line: 118, column: 21, scope: !191)
!224 = !DILocation(line: 119, column: 19, scope: !191)
!225 = !DILocation(line: 119, column: 9, scope: !191)
!226 = !DILocation(line: 120, column: 14, scope: !191)
!227 = !DILocation(line: 120, column: 9, scope: !191)
!228 = !DILocation(line: 122, column: 1, scope: !169)
