; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_10.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %0 = load i32, i32* @globalTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay3, i8** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !56
  store i64 %call, i64* %destLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !61
  %2 = load i64, i64* %destLen, align 8, !dbg !63
  %cmp = icmp ult i64 %1, %2, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !66
  %4 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !66
  %5 = load i8, i8* %arrayidx7, align 1, !dbg !66
  %6 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !70
  store i8 %5, i8* %arrayidx8, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %7, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !78
  store i8 0, i8* %arrayidx9, align 1, !dbg !79
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !80
  call void @printLine(i8* %arraydecay10), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_10_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__char_declare_loop_10_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__char_declare_loop_10_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !113
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !116
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx2, align 1, !dbg !118
  %0 = load i32, i32* @globalFalse, align 4, !dbg !119
  %tobool = icmp ne i32 %0, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !122
  br label %if.end, !dbg !124

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !125
  store i8* %arraydecay3, i8** %data, align 8, !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !135
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !136
  store i8 0, i8* %arrayidx5, align 1, !dbg !137
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !138
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !139
  store i64 %call, i64* %destLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !144
  %2 = load i64, i64* %destLen, align 8, !dbg !146
  %cmp = icmp ult i64 %1, %2, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !149
  %4 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !149
  %5 = load i8, i8* %arrayidx7, align 1, !dbg !149
  %6 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !153
  store i8 %5, i8* %arrayidx8, align 1, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %7, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !160
  store i8 0, i8* %arrayidx9, align 1, !dbg !161
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !162
  call void @printLine(i8* %arraydecay10), !dbg !163
  ret void, !dbg !164
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !165 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !170, metadata !DIExpression()), !dbg !171
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !172
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !173
  store i8 0, i8* %arrayidx, align 1, !dbg !174
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !175
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !176
  store i8 0, i8* %arrayidx2, align 1, !dbg !177
  %0 = load i32, i32* @globalTrue, align 4, !dbg !178
  %tobool = icmp ne i32 %0, 0, !dbg !178
  br i1 %tobool, label %if.then, label %if.end, !dbg !180

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !181
  store i8* %arraydecay3, i8** %data, align 8, !dbg !183
  br label %if.end, !dbg !184

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !185, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !188, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !190, metadata !DIExpression()), !dbg !191
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !192
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !192
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !193
  store i8 0, i8* %arrayidx5, align 1, !dbg !194
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !195
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !196
  store i64 %call, i64* %destLen, align 8, !dbg !197
  store i64 0, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !201
  %2 = load i64, i64* %destLen, align 8, !dbg !203
  %cmp = icmp ult i64 %1, %2, !dbg !204
  br i1 %cmp, label %for.body, label %for.end, !dbg !205

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !206
  %4 = load i64, i64* %i, align 8, !dbg !208
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !206
  %5 = load i8, i8* %arrayidx7, align 1, !dbg !206
  %6 = load i64, i64* %i, align 8, !dbg !209
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !210
  store i8 %5, i8* %arrayidx8, align 1, !dbg !211
  br label %for.inc, !dbg !212

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !213
  %inc = add i64 %7, 1, !dbg !213
  store i64 %inc, i64* %i, align 8, !dbg !213
  br label %for.cond, !dbg !214, !llvm.loop !215

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !217
  store i8 0, i8* %arrayidx9, align 1, !dbg !218
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !219
  call void @printLine(i8* %arraydecay10), !dbg !220
  ret void, !dbg !221
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_10_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 32, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!37 = !DILocation(line: 32, column: 8, scope: !11)
!38 = !DILocation(line: 35, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 35, column: 14, scope: !39)
!41 = !DILocation(line: 36, column: 5, scope: !39)
!42 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 38, type: !44)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 38, column: 16, scope: !43)
!48 = !DILocalVariable(name: "destLen", scope: !43, file: !12, line: 38, type: !44)
!49 = !DILocation(line: 38, column: 19, scope: !43)
!50 = !DILocalVariable(name: "dest", scope: !43, file: !12, line: 39, type: !25)
!51 = !DILocation(line: 39, column: 14, scope: !43)
!52 = !DILocation(line: 40, column: 9, scope: !43)
!53 = !DILocation(line: 41, column: 9, scope: !43)
!54 = !DILocation(line: 41, column: 21, scope: !43)
!55 = !DILocation(line: 42, column: 26, scope: !43)
!56 = !DILocation(line: 42, column: 19, scope: !43)
!57 = !DILocation(line: 42, column: 17, scope: !43)
!58 = !DILocation(line: 45, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !43, file: !12, line: 45, column: 9)
!60 = !DILocation(line: 45, column: 14, scope: !59)
!61 = !DILocation(line: 45, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 45, column: 9)
!63 = !DILocation(line: 45, column: 25, scope: !62)
!64 = !DILocation(line: 45, column: 23, scope: !62)
!65 = !DILocation(line: 45, column: 9, scope: !59)
!66 = !DILocation(line: 47, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !12, line: 46, column: 9)
!68 = !DILocation(line: 47, column: 28, scope: !67)
!69 = !DILocation(line: 47, column: 18, scope: !67)
!70 = !DILocation(line: 47, column: 13, scope: !67)
!71 = !DILocation(line: 47, column: 21, scope: !67)
!72 = !DILocation(line: 48, column: 9, scope: !67)
!73 = !DILocation(line: 45, column: 35, scope: !62)
!74 = !DILocation(line: 45, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 48, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 49, column: 9, scope: !43)
!79 = !DILocation(line: 49, column: 21, scope: !43)
!80 = !DILocation(line: 50, column: 19, scope: !43)
!81 = !DILocation(line: 50, column: 9, scope: !43)
!82 = !DILocation(line: 52, column: 1, scope: !11)
!83 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_10_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 129, column: 5, scope: !83)
!85 = !DILocation(line: 130, column: 5, scope: !83)
!86 = !DILocation(line: 131, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !88, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !90, !91}
!90 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !12, line: 143, type: !90)
!93 = !DILocation(line: 143, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !12, line: 143, type: !91)
!95 = !DILocation(line: 143, column: 27, scope: !87)
!96 = !DILocation(line: 146, column: 22, scope: !87)
!97 = !DILocation(line: 146, column: 12, scope: !87)
!98 = !DILocation(line: 146, column: 5, scope: !87)
!99 = !DILocation(line: 148, column: 5, scope: !87)
!100 = !DILocation(line: 149, column: 5, scope: !87)
!101 = !DILocation(line: 150, column: 5, scope: !87)
!102 = !DILocation(line: 153, column: 5, scope: !87)
!103 = !DILocation(line: 154, column: 5, scope: !87)
!104 = !DILocation(line: 155, column: 5, scope: !87)
!105 = !DILocation(line: 157, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 61, type: !16)
!108 = !DILocation(line: 61, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !12, line: 62, type: !20)
!110 = !DILocation(line: 62, column: 10, scope: !106)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !12, line: 63, type: !25)
!112 = !DILocation(line: 63, column: 10, scope: !106)
!113 = !DILocation(line: 64, column: 5, scope: !106)
!114 = !DILocation(line: 65, column: 5, scope: !106)
!115 = !DILocation(line: 65, column: 25, scope: !106)
!116 = !DILocation(line: 66, column: 5, scope: !106)
!117 = !DILocation(line: 67, column: 5, scope: !106)
!118 = !DILocation(line: 67, column: 27, scope: !106)
!119 = !DILocation(line: 68, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !106, file: !12, line: 68, column: 8)
!121 = !DILocation(line: 68, column: 8, scope: !106)
!122 = !DILocation(line: 71, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 69, column: 5)
!124 = !DILocation(line: 72, column: 5, scope: !123)
!125 = !DILocation(line: 76, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !12, line: 74, column: 5)
!127 = !DILocation(line: 76, column: 14, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !129, file: !12, line: 79, type: !44)
!129 = distinct !DILexicalBlock(scope: !106, file: !12, line: 78, column: 5)
!130 = !DILocation(line: 79, column: 16, scope: !129)
!131 = !DILocalVariable(name: "destLen", scope: !129, file: !12, line: 79, type: !44)
!132 = !DILocation(line: 79, column: 19, scope: !129)
!133 = !DILocalVariable(name: "dest", scope: !129, file: !12, line: 80, type: !25)
!134 = !DILocation(line: 80, column: 14, scope: !129)
!135 = !DILocation(line: 81, column: 9, scope: !129)
!136 = !DILocation(line: 82, column: 9, scope: !129)
!137 = !DILocation(line: 82, column: 21, scope: !129)
!138 = !DILocation(line: 83, column: 26, scope: !129)
!139 = !DILocation(line: 83, column: 19, scope: !129)
!140 = !DILocation(line: 83, column: 17, scope: !129)
!141 = !DILocation(line: 86, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !129, file: !12, line: 86, column: 9)
!143 = !DILocation(line: 86, column: 14, scope: !142)
!144 = !DILocation(line: 86, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 86, column: 9)
!146 = !DILocation(line: 86, column: 25, scope: !145)
!147 = !DILocation(line: 86, column: 23, scope: !145)
!148 = !DILocation(line: 86, column: 9, scope: !142)
!149 = !DILocation(line: 88, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !12, line: 87, column: 9)
!151 = !DILocation(line: 88, column: 28, scope: !150)
!152 = !DILocation(line: 88, column: 18, scope: !150)
!153 = !DILocation(line: 88, column: 13, scope: !150)
!154 = !DILocation(line: 88, column: 21, scope: !150)
!155 = !DILocation(line: 89, column: 9, scope: !150)
!156 = !DILocation(line: 86, column: 35, scope: !145)
!157 = !DILocation(line: 86, column: 9, scope: !145)
!158 = distinct !{!158, !148, !159, !77}
!159 = !DILocation(line: 89, column: 9, scope: !142)
!160 = !DILocation(line: 90, column: 9, scope: !129)
!161 = !DILocation(line: 90, column: 21, scope: !129)
!162 = !DILocation(line: 91, column: 19, scope: !129)
!163 = !DILocation(line: 91, column: 9, scope: !129)
!164 = !DILocation(line: 93, column: 1, scope: !106)
!165 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 96, type: !13, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!166 = !DILocalVariable(name: "data", scope: !165, file: !12, line: 98, type: !16)
!167 = !DILocation(line: 98, column: 12, scope: !165)
!168 = !DILocalVariable(name: "dataBadBuffer", scope: !165, file: !12, line: 99, type: !20)
!169 = !DILocation(line: 99, column: 10, scope: !165)
!170 = !DILocalVariable(name: "dataGoodBuffer", scope: !165, file: !12, line: 100, type: !25)
!171 = !DILocation(line: 100, column: 10, scope: !165)
!172 = !DILocation(line: 101, column: 5, scope: !165)
!173 = !DILocation(line: 102, column: 5, scope: !165)
!174 = !DILocation(line: 102, column: 25, scope: !165)
!175 = !DILocation(line: 103, column: 5, scope: !165)
!176 = !DILocation(line: 104, column: 5, scope: !165)
!177 = !DILocation(line: 104, column: 27, scope: !165)
!178 = !DILocation(line: 105, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !165, file: !12, line: 105, column: 8)
!180 = !DILocation(line: 105, column: 8, scope: !165)
!181 = !DILocation(line: 108, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !12, line: 106, column: 5)
!183 = !DILocation(line: 108, column: 14, scope: !182)
!184 = !DILocation(line: 109, column: 5, scope: !182)
!185 = !DILocalVariable(name: "i", scope: !186, file: !12, line: 111, type: !44)
!186 = distinct !DILexicalBlock(scope: !165, file: !12, line: 110, column: 5)
!187 = !DILocation(line: 111, column: 16, scope: !186)
!188 = !DILocalVariable(name: "destLen", scope: !186, file: !12, line: 111, type: !44)
!189 = !DILocation(line: 111, column: 19, scope: !186)
!190 = !DILocalVariable(name: "dest", scope: !186, file: !12, line: 112, type: !25)
!191 = !DILocation(line: 112, column: 14, scope: !186)
!192 = !DILocation(line: 113, column: 9, scope: !186)
!193 = !DILocation(line: 114, column: 9, scope: !186)
!194 = !DILocation(line: 114, column: 21, scope: !186)
!195 = !DILocation(line: 115, column: 26, scope: !186)
!196 = !DILocation(line: 115, column: 19, scope: !186)
!197 = !DILocation(line: 115, column: 17, scope: !186)
!198 = !DILocation(line: 118, column: 16, scope: !199)
!199 = distinct !DILexicalBlock(scope: !186, file: !12, line: 118, column: 9)
!200 = !DILocation(line: 118, column: 14, scope: !199)
!201 = !DILocation(line: 118, column: 21, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !12, line: 118, column: 9)
!203 = !DILocation(line: 118, column: 25, scope: !202)
!204 = !DILocation(line: 118, column: 23, scope: !202)
!205 = !DILocation(line: 118, column: 9, scope: !199)
!206 = !DILocation(line: 120, column: 23, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !12, line: 119, column: 9)
!208 = !DILocation(line: 120, column: 28, scope: !207)
!209 = !DILocation(line: 120, column: 18, scope: !207)
!210 = !DILocation(line: 120, column: 13, scope: !207)
!211 = !DILocation(line: 120, column: 21, scope: !207)
!212 = !DILocation(line: 121, column: 9, scope: !207)
!213 = !DILocation(line: 118, column: 35, scope: !202)
!214 = !DILocation(line: 118, column: 9, scope: !202)
!215 = distinct !{!215, !205, !216, !77}
!216 = !DILocation(line: 121, column: 9, scope: !199)
!217 = !DILocation(line: 122, column: 9, scope: !186)
!218 = !DILocation(line: 122, column: 21, scope: !186)
!219 = !DILocation(line: 123, column: 19, scope: !186)
!220 = !DILocation(line: 123, column: 9, scope: !186)
!221 = !DILocation(line: 125, column: 1, scope: !165)
