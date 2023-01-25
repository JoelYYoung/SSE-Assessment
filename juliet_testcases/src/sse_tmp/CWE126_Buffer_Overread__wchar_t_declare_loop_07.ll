; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !35
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  %0 = load i32, i32* @staticFive, align 4, !dbg !42
  %cmp = icmp eq i32 %0, 5, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store i32* %arraydecay4, i32** %data, align 8, !dbg !48
  br label %if.end, !dbg !49

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !57, metadata !DIExpression()), !dbg !58
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !60
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx7, align 4, !dbg !62
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !64
  store i64 %call9, i64* %destLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !69
  %2 = load i64, i64* %destLen, align 8, !dbg !71
  %cmp10 = icmp ult i64 %1, %2, !dbg !72
  br i1 %cmp10, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !74
  %4 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx11 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !74
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !74
  %6 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !78
  store i32 %5, i32* %arrayidx12, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %7, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx13, align 4, !dbg !87
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  call void @printWLine(i32* %arraydecay14), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_07_good() #0 !dbg !91 {
entry:
  call void @goodG2B1(), !dbg !92
  call void @goodG2B2(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #5, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #5, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_07_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_07_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !122
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !123
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !127
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx3, align 4, !dbg !129
  %0 = load i32, i32* @staticFive, align 4, !dbg !130
  %cmp = icmp ne i32 %0, 5, !dbg !132
  br i1 %cmp, label %if.then, label %if.else, !dbg !133

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !134
  br label %if.end, !dbg !136

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !137
  store i32* %arraydecay4, i32** %data, align 8, !dbg !139
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !148
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !149
  store i32 0, i32* %arrayidx7, align 4, !dbg !150
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !152
  store i64 %call9, i64* %destLen, align 8, !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !157
  %2 = load i64, i64* %destLen, align 8, !dbg !159
  %cmp10 = icmp ult i64 %1, %2, !dbg !160
  br i1 %cmp10, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !162
  %4 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx11 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !162
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !162
  %6 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !166
  store i32 %5, i32* %arrayidx12, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %7, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !173
  store i32 0, i32* %arrayidx13, align 4, !dbg !174
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !175
  call void @printWLine(i32* %arraydecay14), !dbg !176
  ret void, !dbg !177
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !178 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !183, metadata !DIExpression()), !dbg !184
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !185
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !186
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !187
  store i32 0, i32* %arrayidx, align 4, !dbg !188
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !189
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !190
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !191
  store i32 0, i32* %arrayidx3, align 4, !dbg !192
  %0 = load i32, i32* @staticFive, align 4, !dbg !193
  %cmp = icmp eq i32 %0, 5, !dbg !195
  br i1 %cmp, label %if.then, label %if.end, !dbg !196

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !197
  store i32* %arraydecay4, i32** %data, align 8, !dbg !199
  br label %if.end, !dbg !200

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !201, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !204, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !206, metadata !DIExpression()), !dbg !207
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !208
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !209
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !210
  store i32 0, i32* %arrayidx7, align 4, !dbg !211
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !212
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !213
  store i64 %call9, i64* %destLen, align 8, !dbg !214
  store i64 0, i64* %i, align 8, !dbg !215
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !218
  %2 = load i64, i64* %destLen, align 8, !dbg !220
  %cmp10 = icmp ult i64 %1, %2, !dbg !221
  br i1 %cmp10, label %for.body, label %for.end, !dbg !222

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !223
  %4 = load i64, i64* %i, align 8, !dbg !225
  %arrayidx11 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !223
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !223
  %6 = load i64, i64* %i, align 8, !dbg !226
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !227
  store i32 %5, i32* %arrayidx12, align 4, !dbg !228
  br label %for.inc, !dbg !229

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !230
  %inc = add i64 %7, 1, !dbg !230
  store i64 %inc, i64* %i, align 8, !dbg !230
  br label %for.cond, !dbg !231, !llvm.loop !232

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !234
  store i32 0, i32* %arrayidx13, align 4, !dbg !235
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !236
  call void @printWLine(i32* %arraydecay14), !dbg !237
  ret void, !dbg !238
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 33, column: 13, scope: !16)
!34 = !DILocation(line: 34, column: 13, scope: !16)
!35 = !DILocation(line: 34, column: 5, scope: !16)
!36 = !DILocation(line: 35, column: 5, scope: !16)
!37 = !DILocation(line: 35, column: 25, scope: !16)
!38 = !DILocation(line: 36, column: 13, scope: !16)
!39 = !DILocation(line: 36, column: 5, scope: !16)
!40 = !DILocation(line: 37, column: 5, scope: !16)
!41 = !DILocation(line: 37, column: 27, scope: !16)
!42 = !DILocation(line: 38, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 8)
!44 = !DILocation(line: 38, column: 18, scope: !43)
!45 = !DILocation(line: 38, column: 8, scope: !16)
!46 = !DILocation(line: 41, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !8, line: 39, column: 5)
!48 = !DILocation(line: 41, column: 14, scope: !47)
!49 = !DILocation(line: 42, column: 5, scope: !47)
!50 = !DILocalVariable(name: "i", scope: !51, file: !8, line: 44, type: !52)
!51 = distinct !DILexicalBlock(scope: !16, file: !8, line: 43, column: 5)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !53)
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 44, column: 16, scope: !51)
!55 = !DILocalVariable(name: "destLen", scope: !51, file: !8, line: 44, type: !52)
!56 = !DILocation(line: 44, column: 19, scope: !51)
!57 = !DILocalVariable(name: "dest", scope: !51, file: !8, line: 45, type: !30)
!58 = !DILocation(line: 45, column: 17, scope: !51)
!59 = !DILocation(line: 46, column: 17, scope: !51)
!60 = !DILocation(line: 46, column: 9, scope: !51)
!61 = !DILocation(line: 47, column: 9, scope: !51)
!62 = !DILocation(line: 47, column: 21, scope: !51)
!63 = !DILocation(line: 48, column: 26, scope: !51)
!64 = !DILocation(line: 48, column: 19, scope: !51)
!65 = !DILocation(line: 48, column: 17, scope: !51)
!66 = !DILocation(line: 51, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !51, file: !8, line: 51, column: 9)
!68 = !DILocation(line: 51, column: 14, scope: !67)
!69 = !DILocation(line: 51, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !8, line: 51, column: 9)
!71 = !DILocation(line: 51, column: 25, scope: !70)
!72 = !DILocation(line: 51, column: 23, scope: !70)
!73 = !DILocation(line: 51, column: 9, scope: !67)
!74 = !DILocation(line: 53, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !8, line: 52, column: 9)
!76 = !DILocation(line: 53, column: 28, scope: !75)
!77 = !DILocation(line: 53, column: 18, scope: !75)
!78 = !DILocation(line: 53, column: 13, scope: !75)
!79 = !DILocation(line: 53, column: 21, scope: !75)
!80 = !DILocation(line: 54, column: 9, scope: !75)
!81 = !DILocation(line: 51, column: 35, scope: !70)
!82 = !DILocation(line: 51, column: 9, scope: !70)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 54, column: 9, scope: !67)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 55, column: 9, scope: !51)
!87 = !DILocation(line: 55, column: 21, scope: !51)
!88 = !DILocation(line: 56, column: 20, scope: !51)
!89 = !DILocation(line: 56, column: 9, scope: !51)
!90 = !DILocation(line: 58, column: 1, scope: !16)
!91 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_07_good", scope: !8, file: !8, line: 133, type: !17, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocation(line: 135, column: 5, scope: !91)
!93 = !DILocation(line: 136, column: 5, scope: !91)
!94 = !DILocation(line: 137, column: 1, scope: !91)
!95 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 149, type: !96, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DISubroutineType(types: !97)
!97 = !{!9, !9, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !8, line: 149, type: !9)
!102 = !DILocation(line: 149, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !8, line: 149, type: !98)
!104 = !DILocation(line: 149, column: 27, scope: !95)
!105 = !DILocation(line: 152, column: 22, scope: !95)
!106 = !DILocation(line: 152, column: 12, scope: !95)
!107 = !DILocation(line: 152, column: 5, scope: !95)
!108 = !DILocation(line: 154, column: 5, scope: !95)
!109 = !DILocation(line: 155, column: 5, scope: !95)
!110 = !DILocation(line: 156, column: 5, scope: !95)
!111 = !DILocation(line: 159, column: 5, scope: !95)
!112 = !DILocation(line: 160, column: 5, scope: !95)
!113 = !DILocation(line: 161, column: 5, scope: !95)
!114 = !DILocation(line: 163, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !8, line: 67, type: !20)
!117 = !DILocation(line: 67, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !8, line: 68, type: !25)
!119 = !DILocation(line: 68, column: 13, scope: !115)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !8, line: 69, type: !30)
!121 = !DILocation(line: 69, column: 13, scope: !115)
!122 = !DILocation(line: 70, column: 13, scope: !115)
!123 = !DILocation(line: 70, column: 5, scope: !115)
!124 = !DILocation(line: 71, column: 5, scope: !115)
!125 = !DILocation(line: 71, column: 25, scope: !115)
!126 = !DILocation(line: 72, column: 13, scope: !115)
!127 = !DILocation(line: 72, column: 5, scope: !115)
!128 = !DILocation(line: 73, column: 5, scope: !115)
!129 = !DILocation(line: 73, column: 27, scope: !115)
!130 = !DILocation(line: 74, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !115, file: !8, line: 74, column: 8)
!132 = !DILocation(line: 74, column: 18, scope: !131)
!133 = !DILocation(line: 74, column: 8, scope: !115)
!134 = !DILocation(line: 77, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !8, line: 75, column: 5)
!136 = !DILocation(line: 78, column: 5, scope: !135)
!137 = !DILocation(line: 82, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !131, file: !8, line: 80, column: 5)
!139 = !DILocation(line: 82, column: 14, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !8, line: 85, type: !52)
!141 = distinct !DILexicalBlock(scope: !115, file: !8, line: 84, column: 5)
!142 = !DILocation(line: 85, column: 16, scope: !141)
!143 = !DILocalVariable(name: "destLen", scope: !141, file: !8, line: 85, type: !52)
!144 = !DILocation(line: 85, column: 19, scope: !141)
!145 = !DILocalVariable(name: "dest", scope: !141, file: !8, line: 86, type: !30)
!146 = !DILocation(line: 86, column: 17, scope: !141)
!147 = !DILocation(line: 87, column: 17, scope: !141)
!148 = !DILocation(line: 87, column: 9, scope: !141)
!149 = !DILocation(line: 88, column: 9, scope: !141)
!150 = !DILocation(line: 88, column: 21, scope: !141)
!151 = !DILocation(line: 89, column: 26, scope: !141)
!152 = !DILocation(line: 89, column: 19, scope: !141)
!153 = !DILocation(line: 89, column: 17, scope: !141)
!154 = !DILocation(line: 92, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !141, file: !8, line: 92, column: 9)
!156 = !DILocation(line: 92, column: 14, scope: !155)
!157 = !DILocation(line: 92, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !8, line: 92, column: 9)
!159 = !DILocation(line: 92, column: 25, scope: !158)
!160 = !DILocation(line: 92, column: 23, scope: !158)
!161 = !DILocation(line: 92, column: 9, scope: !155)
!162 = !DILocation(line: 94, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !8, line: 93, column: 9)
!164 = !DILocation(line: 94, column: 28, scope: !163)
!165 = !DILocation(line: 94, column: 18, scope: !163)
!166 = !DILocation(line: 94, column: 13, scope: !163)
!167 = !DILocation(line: 94, column: 21, scope: !163)
!168 = !DILocation(line: 95, column: 9, scope: !163)
!169 = !DILocation(line: 92, column: 35, scope: !158)
!170 = !DILocation(line: 92, column: 9, scope: !158)
!171 = distinct !{!171, !161, !172, !85}
!172 = !DILocation(line: 95, column: 9, scope: !155)
!173 = !DILocation(line: 96, column: 9, scope: !141)
!174 = !DILocation(line: 96, column: 21, scope: !141)
!175 = !DILocation(line: 97, column: 20, scope: !141)
!176 = !DILocation(line: 97, column: 9, scope: !141)
!177 = !DILocation(line: 99, column: 1, scope: !115)
!178 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 102, type: !17, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!179 = !DILocalVariable(name: "data", scope: !178, file: !8, line: 104, type: !20)
!180 = !DILocation(line: 104, column: 15, scope: !178)
!181 = !DILocalVariable(name: "dataBadBuffer", scope: !178, file: !8, line: 105, type: !25)
!182 = !DILocation(line: 105, column: 13, scope: !178)
!183 = !DILocalVariable(name: "dataGoodBuffer", scope: !178, file: !8, line: 106, type: !30)
!184 = !DILocation(line: 106, column: 13, scope: !178)
!185 = !DILocation(line: 107, column: 13, scope: !178)
!186 = !DILocation(line: 107, column: 5, scope: !178)
!187 = !DILocation(line: 108, column: 5, scope: !178)
!188 = !DILocation(line: 108, column: 25, scope: !178)
!189 = !DILocation(line: 109, column: 13, scope: !178)
!190 = !DILocation(line: 109, column: 5, scope: !178)
!191 = !DILocation(line: 110, column: 5, scope: !178)
!192 = !DILocation(line: 110, column: 27, scope: !178)
!193 = !DILocation(line: 111, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !178, file: !8, line: 111, column: 8)
!195 = !DILocation(line: 111, column: 18, scope: !194)
!196 = !DILocation(line: 111, column: 8, scope: !178)
!197 = !DILocation(line: 114, column: 16, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !8, line: 112, column: 5)
!199 = !DILocation(line: 114, column: 14, scope: !198)
!200 = !DILocation(line: 115, column: 5, scope: !198)
!201 = !DILocalVariable(name: "i", scope: !202, file: !8, line: 117, type: !52)
!202 = distinct !DILexicalBlock(scope: !178, file: !8, line: 116, column: 5)
!203 = !DILocation(line: 117, column: 16, scope: !202)
!204 = !DILocalVariable(name: "destLen", scope: !202, file: !8, line: 117, type: !52)
!205 = !DILocation(line: 117, column: 19, scope: !202)
!206 = !DILocalVariable(name: "dest", scope: !202, file: !8, line: 118, type: !30)
!207 = !DILocation(line: 118, column: 17, scope: !202)
!208 = !DILocation(line: 119, column: 17, scope: !202)
!209 = !DILocation(line: 119, column: 9, scope: !202)
!210 = !DILocation(line: 120, column: 9, scope: !202)
!211 = !DILocation(line: 120, column: 21, scope: !202)
!212 = !DILocation(line: 121, column: 26, scope: !202)
!213 = !DILocation(line: 121, column: 19, scope: !202)
!214 = !DILocation(line: 121, column: 17, scope: !202)
!215 = !DILocation(line: 124, column: 16, scope: !216)
!216 = distinct !DILexicalBlock(scope: !202, file: !8, line: 124, column: 9)
!217 = !DILocation(line: 124, column: 14, scope: !216)
!218 = !DILocation(line: 124, column: 21, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !8, line: 124, column: 9)
!220 = !DILocation(line: 124, column: 25, scope: !219)
!221 = !DILocation(line: 124, column: 23, scope: !219)
!222 = !DILocation(line: 124, column: 9, scope: !216)
!223 = !DILocation(line: 126, column: 23, scope: !224)
!224 = distinct !DILexicalBlock(scope: !219, file: !8, line: 125, column: 9)
!225 = !DILocation(line: 126, column: 28, scope: !224)
!226 = !DILocation(line: 126, column: 18, scope: !224)
!227 = !DILocation(line: 126, column: 13, scope: !224)
!228 = !DILocation(line: 126, column: 21, scope: !224)
!229 = !DILocation(line: 127, column: 9, scope: !224)
!230 = !DILocation(line: 124, column: 35, scope: !219)
!231 = !DILocation(line: 124, column: 9, scope: !219)
!232 = distinct !{!232, !222, !233, !85}
!233 = !DILocation(line: 127, column: 9, scope: !216)
!234 = !DILocation(line: 128, column: 9, scope: !202)
!235 = !DILocation(line: 128, column: 21, scope: !202)
!236 = !DILocation(line: 129, column: 20, scope: !202)
!237 = !DILocation(line: 129, column: 9, scope: !202)
!238 = !DILocation(line: 131, column: 1, scope: !178)
