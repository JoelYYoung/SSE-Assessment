; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
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

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_08_good() #0 !dbg !84 {
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
  call void @CWE126_Buffer_Overread__malloc_char_loop_08_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__malloc_char_loop_08_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !107 {
entry:
  ret i32 1, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i8* null, i8** %data, align 8, !dbg !114
  %call = call i32 @staticReturnsFalse(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end3, !dbg !120

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !121
  store i8* %call1, i8** %data, align 8, !dbg !123
  %0 = load i8*, i8** %data, align 8, !dbg !124
  %cmp = icmp eq i8* %0, null, !dbg !126
  br i1 %cmp, label %if.then2, label %if.end, !dbg !127

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %data, align 8, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !131
  %2 = load i8*, i8** %data, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx4, align 1, !dbg !143
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !145
  store i64 %call6, i64* %destLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !150
  %4 = load i64, i64* %destLen, align 8, !dbg !152
  %cmp7 = icmp ult i64 %3, %4, !dbg !153
  br i1 %cmp7, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !155
  %6 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !155
  %7 = load i8, i8* %arrayidx8, align 1, !dbg !155
  %8 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !159
  store i8 %7, i8* %arrayidx9, align 1, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %9, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !166
  store i8 0, i8* %arrayidx10, align 1, !dbg !167
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !168
  call void @printLine(i8* %arraydecay11), !dbg !169
  %10 = load i8*, i8** %data, align 8, !dbg !170
  call void @free(i8* %10) #7, !dbg !171
  ret void, !dbg !172
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !173 {
entry:
  ret i32 0, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !175 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !176, metadata !DIExpression()), !dbg !177
  store i8* null, i8** %data, align 8, !dbg !178
  %call = call i32 @staticReturnsTrue(), !dbg !179
  %tobool = icmp ne i32 %call, 0, !dbg !179
  br i1 %tobool, label %if.then, label %if.end3, !dbg !181

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !182
  store i8* %call1, i8** %data, align 8, !dbg !184
  %0 = load i8*, i8** %data, align 8, !dbg !185
  %cmp = icmp eq i8* %0, null, !dbg !187
  br i1 %cmp, label %if.then2, label %if.end, !dbg !188

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !189
  unreachable, !dbg !189

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !191
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !192
  %2 = load i8*, i8** %data, align 8, !dbg !193
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !193
  store i8 0, i8* %arrayidx, align 1, !dbg !194
  br label %if.end3, !dbg !195

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !196, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !201, metadata !DIExpression()), !dbg !202
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !203
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !203
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !204
  store i8 0, i8* %arrayidx4, align 1, !dbg !205
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !206
  %call6 = call i64 @strlen(i8* %arraydecay5) #9, !dbg !207
  store i64 %call6, i64* %destLen, align 8, !dbg !208
  store i64 0, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !212
  %4 = load i64, i64* %destLen, align 8, !dbg !214
  %cmp7 = icmp ult i64 %3, %4, !dbg !215
  br i1 %cmp7, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !217
  %6 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx8 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !217
  %7 = load i8, i8* %arrayidx8, align 1, !dbg !217
  %8 = load i64, i64* %i, align 8, !dbg !220
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !221
  store i8 %7, i8* %arrayidx9, align 1, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !224
  %inc = add i64 %9, 1, !dbg !224
  store i64 %inc, i64* %i, align 8, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !228
  store i8 0, i8* %arrayidx10, align 1, !dbg !229
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !230
  call void @printLine(i8* %arraydecay11), !dbg !231
  %10 = load i8*, i8** %data, align 8, !dbg !232
  call void @free(i8* %10) #7, !dbg !233
  ret void, !dbg !234
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_08.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 10, scope: !14)
!21 = !DILocation(line: 41, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 8)
!23 = !DILocation(line: 41, column: 8, scope: !14)
!24 = !DILocation(line: 44, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 5)
!26 = !DILocation(line: 44, column: 14, scope: !25)
!27 = !DILocation(line: 45, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 45, column: 13)
!29 = !DILocation(line: 45, column: 18, scope: !28)
!30 = !DILocation(line: 45, column: 13, scope: !25)
!31 = !DILocation(line: 45, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 45, column: 27)
!33 = !DILocation(line: 46, column: 16, scope: !25)
!34 = !DILocation(line: 46, column: 9, scope: !25)
!35 = !DILocation(line: 47, column: 9, scope: !25)
!36 = !DILocation(line: 47, column: 20, scope: !25)
!37 = !DILocation(line: 48, column: 5, scope: !25)
!38 = !DILocalVariable(name: "i", scope: !39, file: !15, line: 50, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 49, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 50, column: 16, scope: !39)
!44 = !DILocalVariable(name: "destLen", scope: !39, file: !15, line: 50, type: !40)
!45 = !DILocation(line: 50, column: 19, scope: !39)
!46 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 51, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 51, column: 14, scope: !39)
!51 = !DILocation(line: 52, column: 9, scope: !39)
!52 = !DILocation(line: 53, column: 9, scope: !39)
!53 = !DILocation(line: 53, column: 21, scope: !39)
!54 = !DILocation(line: 54, column: 26, scope: !39)
!55 = !DILocation(line: 54, column: 19, scope: !39)
!56 = !DILocation(line: 54, column: 17, scope: !39)
!57 = !DILocation(line: 57, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !39, file: !15, line: 57, column: 9)
!59 = !DILocation(line: 57, column: 14, scope: !58)
!60 = !DILocation(line: 57, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !15, line: 57, column: 9)
!62 = !DILocation(line: 57, column: 25, scope: !61)
!63 = !DILocation(line: 57, column: 23, scope: !61)
!64 = !DILocation(line: 57, column: 9, scope: !58)
!65 = !DILocation(line: 59, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !15, line: 58, column: 9)
!67 = !DILocation(line: 59, column: 28, scope: !66)
!68 = !DILocation(line: 59, column: 18, scope: !66)
!69 = !DILocation(line: 59, column: 13, scope: !66)
!70 = !DILocation(line: 59, column: 21, scope: !66)
!71 = !DILocation(line: 60, column: 9, scope: !66)
!72 = !DILocation(line: 57, column: 35, scope: !61)
!73 = !DILocation(line: 57, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 60, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 61, column: 9, scope: !39)
!78 = !DILocation(line: 61, column: 21, scope: !39)
!79 = !DILocation(line: 62, column: 19, scope: !39)
!80 = !DILocation(line: 62, column: 9, scope: !39)
!81 = !DILocation(line: 63, column: 14, scope: !39)
!82 = !DILocation(line: 63, column: 9, scope: !39)
!83 = !DILocation(line: 65, column: 1, scope: !14)
!84 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_08_good", scope: !15, file: !15, line: 138, type: !16, scopeLine: 139, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 140, column: 5, scope: !84)
!86 = !DILocation(line: 141, column: 5, scope: !84)
!87 = !DILocation(line: 142, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 154, type: !89, scopeLine: 155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !91, !92}
!91 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !15, line: 154, type: !91)
!94 = !DILocation(line: 154, column: 14, scope: !88)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !15, line: 154, type: !92)
!96 = !DILocation(line: 154, column: 27, scope: !88)
!97 = !DILocation(line: 157, column: 22, scope: !88)
!98 = !DILocation(line: 157, column: 12, scope: !88)
!99 = !DILocation(line: 157, column: 5, scope: !88)
!100 = !DILocation(line: 159, column: 5, scope: !88)
!101 = !DILocation(line: 160, column: 5, scope: !88)
!102 = !DILocation(line: 161, column: 5, scope: !88)
!103 = !DILocation(line: 164, column: 5, scope: !88)
!104 = !DILocation(line: 165, column: 5, scope: !88)
!105 = !DILocation(line: 166, column: 5, scope: !88)
!106 = !DILocation(line: 168, column: 5, scope: !88)
!107 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !108, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DISubroutineType(types: !109)
!109 = !{!91}
!110 = !DILocation(line: 27, column: 5, scope: !107)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 72, type: !16, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 74, type: !4)
!113 = !DILocation(line: 74, column: 12, scope: !111)
!114 = !DILocation(line: 75, column: 10, scope: !111)
!115 = !DILocation(line: 76, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !15, line: 76, column: 8)
!117 = !DILocation(line: 76, column: 8, scope: !111)
!118 = !DILocation(line: 79, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !15, line: 77, column: 5)
!120 = !DILocation(line: 80, column: 5, scope: !119)
!121 = !DILocation(line: 84, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !15, line: 82, column: 5)
!123 = !DILocation(line: 84, column: 14, scope: !122)
!124 = !DILocation(line: 85, column: 13, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !15, line: 85, column: 13)
!126 = !DILocation(line: 85, column: 18, scope: !125)
!127 = !DILocation(line: 85, column: 13, scope: !122)
!128 = !DILocation(line: 85, column: 28, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !15, line: 85, column: 27)
!130 = !DILocation(line: 86, column: 16, scope: !122)
!131 = !DILocation(line: 86, column: 9, scope: !122)
!132 = !DILocation(line: 87, column: 9, scope: !122)
!133 = !DILocation(line: 87, column: 21, scope: !122)
!134 = !DILocalVariable(name: "i", scope: !135, file: !15, line: 90, type: !40)
!135 = distinct !DILexicalBlock(scope: !111, file: !15, line: 89, column: 5)
!136 = !DILocation(line: 90, column: 16, scope: !135)
!137 = !DILocalVariable(name: "destLen", scope: !135, file: !15, line: 90, type: !40)
!138 = !DILocation(line: 90, column: 19, scope: !135)
!139 = !DILocalVariable(name: "dest", scope: !135, file: !15, line: 91, type: !47)
!140 = !DILocation(line: 91, column: 14, scope: !135)
!141 = !DILocation(line: 92, column: 9, scope: !135)
!142 = !DILocation(line: 93, column: 9, scope: !135)
!143 = !DILocation(line: 93, column: 21, scope: !135)
!144 = !DILocation(line: 94, column: 26, scope: !135)
!145 = !DILocation(line: 94, column: 19, scope: !135)
!146 = !DILocation(line: 94, column: 17, scope: !135)
!147 = !DILocation(line: 97, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !135, file: !15, line: 97, column: 9)
!149 = !DILocation(line: 97, column: 14, scope: !148)
!150 = !DILocation(line: 97, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !15, line: 97, column: 9)
!152 = !DILocation(line: 97, column: 25, scope: !151)
!153 = !DILocation(line: 97, column: 23, scope: !151)
!154 = !DILocation(line: 97, column: 9, scope: !148)
!155 = !DILocation(line: 99, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !15, line: 98, column: 9)
!157 = !DILocation(line: 99, column: 28, scope: !156)
!158 = !DILocation(line: 99, column: 18, scope: !156)
!159 = !DILocation(line: 99, column: 13, scope: !156)
!160 = !DILocation(line: 99, column: 21, scope: !156)
!161 = !DILocation(line: 100, column: 9, scope: !156)
!162 = !DILocation(line: 97, column: 35, scope: !151)
!163 = !DILocation(line: 97, column: 9, scope: !151)
!164 = distinct !{!164, !154, !165, !76}
!165 = !DILocation(line: 100, column: 9, scope: !148)
!166 = !DILocation(line: 101, column: 9, scope: !135)
!167 = !DILocation(line: 101, column: 21, scope: !135)
!168 = !DILocation(line: 102, column: 19, scope: !135)
!169 = !DILocation(line: 102, column: 9, scope: !135)
!170 = !DILocation(line: 103, column: 14, scope: !135)
!171 = !DILocation(line: 103, column: 9, scope: !135)
!172 = !DILocation(line: 105, column: 1, scope: !111)
!173 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !108, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!174 = !DILocation(line: 32, column: 5, scope: !173)
!175 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 108, type: !16, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!176 = !DILocalVariable(name: "data", scope: !175, file: !15, line: 110, type: !4)
!177 = !DILocation(line: 110, column: 12, scope: !175)
!178 = !DILocation(line: 111, column: 10, scope: !175)
!179 = !DILocation(line: 112, column: 8, scope: !180)
!180 = distinct !DILexicalBlock(scope: !175, file: !15, line: 112, column: 8)
!181 = !DILocation(line: 112, column: 8, scope: !175)
!182 = !DILocation(line: 115, column: 24, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !15, line: 113, column: 5)
!184 = !DILocation(line: 115, column: 14, scope: !183)
!185 = !DILocation(line: 116, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !15, line: 116, column: 13)
!187 = !DILocation(line: 116, column: 18, scope: !186)
!188 = !DILocation(line: 116, column: 13, scope: !183)
!189 = !DILocation(line: 116, column: 28, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !15, line: 116, column: 27)
!191 = !DILocation(line: 117, column: 16, scope: !183)
!192 = !DILocation(line: 117, column: 9, scope: !183)
!193 = !DILocation(line: 118, column: 9, scope: !183)
!194 = !DILocation(line: 118, column: 21, scope: !183)
!195 = !DILocation(line: 119, column: 5, scope: !183)
!196 = !DILocalVariable(name: "i", scope: !197, file: !15, line: 121, type: !40)
!197 = distinct !DILexicalBlock(scope: !175, file: !15, line: 120, column: 5)
!198 = !DILocation(line: 121, column: 16, scope: !197)
!199 = !DILocalVariable(name: "destLen", scope: !197, file: !15, line: 121, type: !40)
!200 = !DILocation(line: 121, column: 19, scope: !197)
!201 = !DILocalVariable(name: "dest", scope: !197, file: !15, line: 122, type: !47)
!202 = !DILocation(line: 122, column: 14, scope: !197)
!203 = !DILocation(line: 123, column: 9, scope: !197)
!204 = !DILocation(line: 124, column: 9, scope: !197)
!205 = !DILocation(line: 124, column: 21, scope: !197)
!206 = !DILocation(line: 125, column: 26, scope: !197)
!207 = !DILocation(line: 125, column: 19, scope: !197)
!208 = !DILocation(line: 125, column: 17, scope: !197)
!209 = !DILocation(line: 128, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !197, file: !15, line: 128, column: 9)
!211 = !DILocation(line: 128, column: 14, scope: !210)
!212 = !DILocation(line: 128, column: 21, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !15, line: 128, column: 9)
!214 = !DILocation(line: 128, column: 25, scope: !213)
!215 = !DILocation(line: 128, column: 23, scope: !213)
!216 = !DILocation(line: 128, column: 9, scope: !210)
!217 = !DILocation(line: 130, column: 23, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !15, line: 129, column: 9)
!219 = !DILocation(line: 130, column: 28, scope: !218)
!220 = !DILocation(line: 130, column: 18, scope: !218)
!221 = !DILocation(line: 130, column: 13, scope: !218)
!222 = !DILocation(line: 130, column: 21, scope: !218)
!223 = !DILocation(line: 131, column: 9, scope: !218)
!224 = !DILocation(line: 128, column: 35, scope: !213)
!225 = !DILocation(line: 128, column: 9, scope: !213)
!226 = distinct !{!226, !216, !227, !76}
!227 = !DILocation(line: 131, column: 9, scope: !210)
!228 = !DILocation(line: 132, column: 9, scope: !197)
!229 = !DILocation(line: 132, column: 21, scope: !197)
!230 = !DILocation(line: 133, column: 19, scope: !197)
!231 = !DILocation(line: 133, column: 9, scope: !197)
!232 = !DILocation(line: 134, column: 14, scope: !197)
!233 = !DILocation(line: 134, column: 9, scope: !197)
!234 = !DILocation(line: 136, column: 1, scope: !175)
