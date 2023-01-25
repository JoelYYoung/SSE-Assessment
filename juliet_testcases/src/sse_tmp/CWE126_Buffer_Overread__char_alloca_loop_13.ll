; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_13_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %6 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !33
  %cmp = icmp eq i32 %6, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataBadBuffer, align 8, !dbg !37
  store i8* %7, i8** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !49, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx2, align 1, !dbg !56
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !58
  store i64 %call, i64* %destLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !63
  %9 = load i64, i64* %destLen, align 8, !dbg !65
  %cmp4 = icmp ult i64 %8, %9, !dbg !66
  br i1 %cmp4, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !68
  %11 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !68
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !68
  %13 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !72
  store i8 %12, i8* %arrayidx6, align 1, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %14, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !80
  store i8 0, i8* %arrayidx7, align 1, !dbg !81
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !82
  call void @printLine(i8* %arraydecay8), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_13_good() #0 !dbg !85 {
entry:
  call void @goodG2B1(), !dbg !86
  call void @goodG2B2(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__char_alloca_loop_13_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__char_alloca_loop_13_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 50, align 16, !dbg !113
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %1 = alloca i8, i64 100, align 16, !dbg !116
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !115
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !118
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !122
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !123
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !123
  store i8 0, i8* %arrayidx1, align 1, !dbg !124
  %6 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !125
  %cmp = icmp ne i32 %6, 5, !dbg !127
  br i1 %cmp, label %if.then, label %if.else, !dbg !128

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !129
  br label %if.end, !dbg !131

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !132
  store i8* %7, i8** %data, align 8, !dbg !134
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !142
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !143
  store i8 0, i8* %arrayidx2, align 1, !dbg !144
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !146
  store i64 %call, i64* %destLen, align 8, !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !151
  %9 = load i64, i64* %destLen, align 8, !dbg !153
  %cmp4 = icmp ult i64 %8, %9, !dbg !154
  br i1 %cmp4, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !156
  %11 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !156
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !156
  %13 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !160
  store i8 %12, i8* %arrayidx6, align 1, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %14, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !167
  store i8 0, i8* %arrayidx7, align 1, !dbg !168
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !169
  call void @printLine(i8* %arraydecay8), !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !172 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !175, metadata !DIExpression()), !dbg !176
  %0 = alloca i8, i64 50, align 16, !dbg !177
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !176
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !178, metadata !DIExpression()), !dbg !179
  %1 = alloca i8, i64 100, align 16, !dbg !180
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !179
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !182
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !183
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !183
  store i8 0, i8* %arrayidx, align 1, !dbg !184
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !185
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !186
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !187
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !187
  store i8 0, i8* %arrayidx1, align 1, !dbg !188
  %6 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !189
  %cmp = icmp eq i32 %6, 5, !dbg !191
  br i1 %cmp, label %if.then, label %if.end, !dbg !192

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !193
  store i8* %7, i8** %data, align 8, !dbg !195
  br label %if.end, !dbg !196

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !197, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !200, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !202, metadata !DIExpression()), !dbg !203
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !204
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !205
  store i8 0, i8* %arrayidx2, align 1, !dbg !206
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !207
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !208
  store i64 %call, i64* %destLen, align 8, !dbg !209
  store i64 0, i64* %i, align 8, !dbg !210
  br label %for.cond, !dbg !212

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !213
  %9 = load i64, i64* %destLen, align 8, !dbg !215
  %cmp4 = icmp ult i64 %8, %9, !dbg !216
  br i1 %cmp4, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !218
  %11 = load i64, i64* %i, align 8, !dbg !220
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !218
  %12 = load i8, i8* %arrayidx5, align 1, !dbg !218
  %13 = load i64, i64* %i, align 8, !dbg !221
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !222
  store i8 %12, i8* %arrayidx6, align 1, !dbg !223
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !225
  %inc = add i64 %14, 1, !dbg !225
  store i64 %inc, i64* %i, align 8, !dbg !225
  br label %for.cond, !dbg !226, !llvm.loop !227

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !229
  store i8 0, i8* %arrayidx7, align 1, !dbg !230
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !231
  call void @printLine(i8* %arraydecay8), !dbg !232
  ret void, !dbg !233
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_13_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 12, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 12, scope: !13)
!30 = !DILocation(line: 30, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 5, scope: !13)
!32 = !DILocation(line: 31, column: 27, scope: !13)
!33 = !DILocation(line: 32, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!35 = !DILocation(line: 32, column: 25, scope: !34)
!36 = !DILocation(line: 32, column: 8, scope: !13)
!37 = !DILocation(line: 35, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !14, line: 33, column: 5)
!39 = !DILocation(line: 35, column: 14, scope: !38)
!40 = !DILocation(line: 36, column: 5, scope: !38)
!41 = !DILocalVariable(name: "i", scope: !42, file: !14, line: 38, type: !43)
!42 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 38, column: 16, scope: !42)
!47 = !DILocalVariable(name: "destLen", scope: !42, file: !14, line: 38, type: !43)
!48 = !DILocation(line: 38, column: 19, scope: !42)
!49 = !DILocalVariable(name: "dest", scope: !42, file: !14, line: 39, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 39, column: 14, scope: !42)
!54 = !DILocation(line: 40, column: 9, scope: !42)
!55 = !DILocation(line: 41, column: 9, scope: !42)
!56 = !DILocation(line: 41, column: 21, scope: !42)
!57 = !DILocation(line: 42, column: 26, scope: !42)
!58 = !DILocation(line: 42, column: 19, scope: !42)
!59 = !DILocation(line: 42, column: 17, scope: !42)
!60 = !DILocation(line: 45, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !42, file: !14, line: 45, column: 9)
!62 = !DILocation(line: 45, column: 14, scope: !61)
!63 = !DILocation(line: 45, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !14, line: 45, column: 9)
!65 = !DILocation(line: 45, column: 25, scope: !64)
!66 = !DILocation(line: 45, column: 23, scope: !64)
!67 = !DILocation(line: 45, column: 9, scope: !61)
!68 = !DILocation(line: 47, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !14, line: 46, column: 9)
!70 = !DILocation(line: 47, column: 28, scope: !69)
!71 = !DILocation(line: 47, column: 18, scope: !69)
!72 = !DILocation(line: 47, column: 13, scope: !69)
!73 = !DILocation(line: 47, column: 21, scope: !69)
!74 = !DILocation(line: 48, column: 9, scope: !69)
!75 = !DILocation(line: 45, column: 35, scope: !64)
!76 = !DILocation(line: 45, column: 9, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 48, column: 9, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 49, column: 9, scope: !42)
!81 = !DILocation(line: 49, column: 21, scope: !42)
!82 = !DILocation(line: 50, column: 19, scope: !42)
!83 = !DILocation(line: 50, column: 9, scope: !42)
!84 = !DILocation(line: 52, column: 1, scope: !13)
!85 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_13_good", scope: !14, file: !14, line: 127, type: !15, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 129, column: 5, scope: !85)
!87 = !DILocation(line: 130, column: 5, scope: !85)
!88 = !DILocation(line: 131, column: 1, scope: !85)
!89 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 143, type: !90, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !92, !93}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !14, line: 143, type: !92)
!95 = !DILocation(line: 143, column: 14, scope: !89)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !14, line: 143, type: !93)
!97 = !DILocation(line: 143, column: 27, scope: !89)
!98 = !DILocation(line: 146, column: 22, scope: !89)
!99 = !DILocation(line: 146, column: 12, scope: !89)
!100 = !DILocation(line: 146, column: 5, scope: !89)
!101 = !DILocation(line: 148, column: 5, scope: !89)
!102 = !DILocation(line: 149, column: 5, scope: !89)
!103 = !DILocation(line: 150, column: 5, scope: !89)
!104 = !DILocation(line: 153, column: 5, scope: !89)
!105 = !DILocation(line: 154, column: 5, scope: !89)
!106 = !DILocation(line: 155, column: 5, scope: !89)
!107 = !DILocation(line: 157, column: 5, scope: !89)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !14, line: 61, type: !4)
!110 = !DILocation(line: 61, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !14, line: 62, type: !4)
!112 = !DILocation(line: 62, column: 12, scope: !108)
!113 = !DILocation(line: 62, column: 36, scope: !108)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !14, line: 63, type: !4)
!115 = !DILocation(line: 63, column: 12, scope: !108)
!116 = !DILocation(line: 63, column: 37, scope: !108)
!117 = !DILocation(line: 64, column: 12, scope: !108)
!118 = !DILocation(line: 64, column: 5, scope: !108)
!119 = !DILocation(line: 65, column: 5, scope: !108)
!120 = !DILocation(line: 65, column: 25, scope: !108)
!121 = !DILocation(line: 66, column: 12, scope: !108)
!122 = !DILocation(line: 66, column: 5, scope: !108)
!123 = !DILocation(line: 67, column: 5, scope: !108)
!124 = !DILocation(line: 67, column: 27, scope: !108)
!125 = !DILocation(line: 68, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !108, file: !14, line: 68, column: 8)
!127 = !DILocation(line: 68, column: 25, scope: !126)
!128 = !DILocation(line: 68, column: 8, scope: !108)
!129 = !DILocation(line: 71, column: 9, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !14, line: 69, column: 5)
!131 = !DILocation(line: 72, column: 5, scope: !130)
!132 = !DILocation(line: 76, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !14, line: 74, column: 5)
!134 = !DILocation(line: 76, column: 14, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !14, line: 79, type: !43)
!136 = distinct !DILexicalBlock(scope: !108, file: !14, line: 78, column: 5)
!137 = !DILocation(line: 79, column: 16, scope: !136)
!138 = !DILocalVariable(name: "destLen", scope: !136, file: !14, line: 79, type: !43)
!139 = !DILocation(line: 79, column: 19, scope: !136)
!140 = !DILocalVariable(name: "dest", scope: !136, file: !14, line: 80, type: !50)
!141 = !DILocation(line: 80, column: 14, scope: !136)
!142 = !DILocation(line: 81, column: 9, scope: !136)
!143 = !DILocation(line: 82, column: 9, scope: !136)
!144 = !DILocation(line: 82, column: 21, scope: !136)
!145 = !DILocation(line: 83, column: 26, scope: !136)
!146 = !DILocation(line: 83, column: 19, scope: !136)
!147 = !DILocation(line: 83, column: 17, scope: !136)
!148 = !DILocation(line: 86, column: 16, scope: !149)
!149 = distinct !DILexicalBlock(scope: !136, file: !14, line: 86, column: 9)
!150 = !DILocation(line: 86, column: 14, scope: !149)
!151 = !DILocation(line: 86, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !14, line: 86, column: 9)
!153 = !DILocation(line: 86, column: 25, scope: !152)
!154 = !DILocation(line: 86, column: 23, scope: !152)
!155 = !DILocation(line: 86, column: 9, scope: !149)
!156 = !DILocation(line: 88, column: 23, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !14, line: 87, column: 9)
!158 = !DILocation(line: 88, column: 28, scope: !157)
!159 = !DILocation(line: 88, column: 18, scope: !157)
!160 = !DILocation(line: 88, column: 13, scope: !157)
!161 = !DILocation(line: 88, column: 21, scope: !157)
!162 = !DILocation(line: 89, column: 9, scope: !157)
!163 = !DILocation(line: 86, column: 35, scope: !152)
!164 = !DILocation(line: 86, column: 9, scope: !152)
!165 = distinct !{!165, !155, !166, !79}
!166 = !DILocation(line: 89, column: 9, scope: !149)
!167 = !DILocation(line: 90, column: 9, scope: !136)
!168 = !DILocation(line: 90, column: 21, scope: !136)
!169 = !DILocation(line: 91, column: 19, scope: !136)
!170 = !DILocation(line: 91, column: 9, scope: !136)
!171 = !DILocation(line: 93, column: 1, scope: !108)
!172 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 96, type: !15, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!173 = !DILocalVariable(name: "data", scope: !172, file: !14, line: 98, type: !4)
!174 = !DILocation(line: 98, column: 12, scope: !172)
!175 = !DILocalVariable(name: "dataBadBuffer", scope: !172, file: !14, line: 99, type: !4)
!176 = !DILocation(line: 99, column: 12, scope: !172)
!177 = !DILocation(line: 99, column: 36, scope: !172)
!178 = !DILocalVariable(name: "dataGoodBuffer", scope: !172, file: !14, line: 100, type: !4)
!179 = !DILocation(line: 100, column: 12, scope: !172)
!180 = !DILocation(line: 100, column: 37, scope: !172)
!181 = !DILocation(line: 101, column: 12, scope: !172)
!182 = !DILocation(line: 101, column: 5, scope: !172)
!183 = !DILocation(line: 102, column: 5, scope: !172)
!184 = !DILocation(line: 102, column: 25, scope: !172)
!185 = !DILocation(line: 103, column: 12, scope: !172)
!186 = !DILocation(line: 103, column: 5, scope: !172)
!187 = !DILocation(line: 104, column: 5, scope: !172)
!188 = !DILocation(line: 104, column: 27, scope: !172)
!189 = !DILocation(line: 105, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !172, file: !14, line: 105, column: 8)
!191 = !DILocation(line: 105, column: 25, scope: !190)
!192 = !DILocation(line: 105, column: 8, scope: !172)
!193 = !DILocation(line: 108, column: 16, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !14, line: 106, column: 5)
!195 = !DILocation(line: 108, column: 14, scope: !194)
!196 = !DILocation(line: 109, column: 5, scope: !194)
!197 = !DILocalVariable(name: "i", scope: !198, file: !14, line: 111, type: !43)
!198 = distinct !DILexicalBlock(scope: !172, file: !14, line: 110, column: 5)
!199 = !DILocation(line: 111, column: 16, scope: !198)
!200 = !DILocalVariable(name: "destLen", scope: !198, file: !14, line: 111, type: !43)
!201 = !DILocation(line: 111, column: 19, scope: !198)
!202 = !DILocalVariable(name: "dest", scope: !198, file: !14, line: 112, type: !50)
!203 = !DILocation(line: 112, column: 14, scope: !198)
!204 = !DILocation(line: 113, column: 9, scope: !198)
!205 = !DILocation(line: 114, column: 9, scope: !198)
!206 = !DILocation(line: 114, column: 21, scope: !198)
!207 = !DILocation(line: 115, column: 26, scope: !198)
!208 = !DILocation(line: 115, column: 19, scope: !198)
!209 = !DILocation(line: 115, column: 17, scope: !198)
!210 = !DILocation(line: 118, column: 16, scope: !211)
!211 = distinct !DILexicalBlock(scope: !198, file: !14, line: 118, column: 9)
!212 = !DILocation(line: 118, column: 14, scope: !211)
!213 = !DILocation(line: 118, column: 21, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !14, line: 118, column: 9)
!215 = !DILocation(line: 118, column: 25, scope: !214)
!216 = !DILocation(line: 118, column: 23, scope: !214)
!217 = !DILocation(line: 118, column: 9, scope: !211)
!218 = !DILocation(line: 120, column: 23, scope: !219)
!219 = distinct !DILexicalBlock(scope: !214, file: !14, line: 119, column: 9)
!220 = !DILocation(line: 120, column: 28, scope: !219)
!221 = !DILocation(line: 120, column: 18, scope: !219)
!222 = !DILocation(line: 120, column: 13, scope: !219)
!223 = !DILocation(line: 120, column: 21, scope: !219)
!224 = !DILocation(line: 121, column: 9, scope: !219)
!225 = !DILocation(line: 118, column: 35, scope: !214)
!226 = !DILocation(line: 118, column: 9, scope: !214)
!227 = distinct !{!227, !217, !228, !79}
!228 = !DILocation(line: 121, column: 9, scope: !211)
!229 = !DILocation(line: 122, column: 9, scope: !198)
!230 = !DILocation(line: 122, column: 21, scope: !198)
!231 = !DILocation(line: 123, column: 19, scope: !198)
!232 = !DILocation(line: 123, column: 9, scope: !198)
!233 = !DILocation(line: 125, column: 1, scope: !172)
