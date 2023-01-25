; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !37
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !40
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !41
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx3, align 4, !dbg !43
  %0 = load i32, i32* @staticTrue, align 4, !dbg !44
  %tobool = icmp ne i32 %0, 0, !dbg !44
  br i1 %tobool, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !47
  store i32* %arraydecay4, i32** %data, align 8, !dbg !49
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !61
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx7, align 4, !dbg !63
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !65
  store i64 %call9, i64* %destLen, align 8, !dbg !66
  store i64 0, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !70
  %2 = load i64, i64* %destLen, align 8, !dbg !72
  %cmp = icmp ult i64 %1, %2, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !75
  %4 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx10 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !75
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !75
  %6 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !79
  store i32 %5, i32* %arrayidx11, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %7, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx12, align 4, !dbg !88
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !89
  call void @printWLine(i32* %arraydecay13), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_05_good() #0 !dbg !92 {
entry:
  call void @goodG2B1(), !dbg !93
  call void @goodG2B2(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #5, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #5, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_05_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_05_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !123
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !124
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !128
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx3, align 4, !dbg !130
  %0 = load i32, i32* @staticFalse, align 4, !dbg !131
  %tobool = icmp ne i32 %0, 0, !dbg !131
  br i1 %tobool, label %if.then, label %if.else, !dbg !133

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
  %cmp = icmp ult i64 %1, %2, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !162
  %4 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx10 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !162
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !162
  %6 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !166
  store i32 %5, i32* %arrayidx11, align 4, !dbg !167
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !169
  %inc = add i64 %7, 1, !dbg !169
  store i64 %inc, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !173
  store i32 0, i32* %arrayidx12, align 4, !dbg !174
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !175
  call void @printWLine(i32* %arraydecay13), !dbg !176
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !193
  %tobool = icmp ne i32 %0, 0, !dbg !193
  br i1 %tobool, label %if.then, label %if.end, !dbg !195

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !196
  store i32* %arraydecay4, i32** %data, align 8, !dbg !198
  br label %if.end, !dbg !199

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !205, metadata !DIExpression()), !dbg !206
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !207
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !208
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !209
  store i32 0, i32* %arrayidx7, align 4, !dbg !210
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !211
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !212
  store i64 %call9, i64* %destLen, align 8, !dbg !213
  store i64 0, i64* %i, align 8, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !217
  %2 = load i64, i64* %destLen, align 8, !dbg !219
  %cmp = icmp ult i64 %1, %2, !dbg !220
  br i1 %cmp, label %for.body, label %for.end, !dbg !221

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !222
  %4 = load i64, i64* %i, align 8, !dbg !224
  %arrayidx10 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !222
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !222
  %6 = load i64, i64* %i, align 8, !dbg !225
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !226
  store i32 %5, i32* %arrayidx11, align 4, !dbg !227
  br label %for.inc, !dbg !228

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !229
  %inc = add i64 %7, 1, !dbg !229
  store i64 %inc, i64* %i, align 8, !dbg !229
  br label %for.cond, !dbg !230, !llvm.loop !231

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !233
  store i32 0, i32* %arrayidx12, align 4, !dbg !234
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !235
  call void @printWLine(i32* %arraydecay13), !dbg !236
  ret void, !dbg !237
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 13, scope: !18)
!36 = !DILocation(line: 35, column: 13, scope: !18)
!37 = !DILocation(line: 35, column: 5, scope: !18)
!38 = !DILocation(line: 36, column: 5, scope: !18)
!39 = !DILocation(line: 36, column: 25, scope: !18)
!40 = !DILocation(line: 37, column: 13, scope: !18)
!41 = !DILocation(line: 37, column: 5, scope: !18)
!42 = !DILocation(line: 38, column: 5, scope: !18)
!43 = !DILocation(line: 38, column: 27, scope: !18)
!44 = !DILocation(line: 39, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 8)
!46 = !DILocation(line: 39, column: 8, scope: !18)
!47 = !DILocation(line: 42, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !10, line: 40, column: 5)
!49 = !DILocation(line: 42, column: 14, scope: !48)
!50 = !DILocation(line: 43, column: 5, scope: !48)
!51 = !DILocalVariable(name: "i", scope: !52, file: !10, line: 45, type: !53)
!52 = distinct !DILexicalBlock(scope: !18, file: !10, line: 44, column: 5)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 45, column: 16, scope: !52)
!56 = !DILocalVariable(name: "destLen", scope: !52, file: !10, line: 45, type: !53)
!57 = !DILocation(line: 45, column: 19, scope: !52)
!58 = !DILocalVariable(name: "dest", scope: !52, file: !10, line: 46, type: !32)
!59 = !DILocation(line: 46, column: 17, scope: !52)
!60 = !DILocation(line: 47, column: 17, scope: !52)
!61 = !DILocation(line: 47, column: 9, scope: !52)
!62 = !DILocation(line: 48, column: 9, scope: !52)
!63 = !DILocation(line: 48, column: 21, scope: !52)
!64 = !DILocation(line: 49, column: 26, scope: !52)
!65 = !DILocation(line: 49, column: 19, scope: !52)
!66 = !DILocation(line: 49, column: 17, scope: !52)
!67 = !DILocation(line: 52, column: 16, scope: !68)
!68 = distinct !DILexicalBlock(scope: !52, file: !10, line: 52, column: 9)
!69 = !DILocation(line: 52, column: 14, scope: !68)
!70 = !DILocation(line: 52, column: 21, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !10, line: 52, column: 9)
!72 = !DILocation(line: 52, column: 25, scope: !71)
!73 = !DILocation(line: 52, column: 23, scope: !71)
!74 = !DILocation(line: 52, column: 9, scope: !68)
!75 = !DILocation(line: 54, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !10, line: 53, column: 9)
!77 = !DILocation(line: 54, column: 28, scope: !76)
!78 = !DILocation(line: 54, column: 18, scope: !76)
!79 = !DILocation(line: 54, column: 13, scope: !76)
!80 = !DILocation(line: 54, column: 21, scope: !76)
!81 = !DILocation(line: 55, column: 9, scope: !76)
!82 = !DILocation(line: 52, column: 35, scope: !71)
!83 = !DILocation(line: 52, column: 9, scope: !71)
!84 = distinct !{!84, !74, !85, !86}
!85 = !DILocation(line: 55, column: 9, scope: !68)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 56, column: 9, scope: !52)
!88 = !DILocation(line: 56, column: 21, scope: !52)
!89 = !DILocation(line: 57, column: 20, scope: !52)
!90 = !DILocation(line: 57, column: 9, scope: !52)
!91 = !DILocation(line: 59, column: 1, scope: !18)
!92 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_05_good", scope: !10, file: !10, line: 134, type: !19, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 136, column: 5, scope: !92)
!94 = !DILocation(line: 137, column: 5, scope: !92)
!95 = !DILocation(line: 138, column: 1, scope: !92)
!96 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 150, type: !97, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DISubroutineType(types: !98)
!98 = !{!11, !11, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !10, line: 150, type: !11)
!103 = !DILocation(line: 150, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !10, line: 150, type: !99)
!105 = !DILocation(line: 150, column: 27, scope: !96)
!106 = !DILocation(line: 153, column: 22, scope: !96)
!107 = !DILocation(line: 153, column: 12, scope: !96)
!108 = !DILocation(line: 153, column: 5, scope: !96)
!109 = !DILocation(line: 155, column: 5, scope: !96)
!110 = !DILocation(line: 156, column: 5, scope: !96)
!111 = !DILocation(line: 157, column: 5, scope: !96)
!112 = !DILocation(line: 160, column: 5, scope: !96)
!113 = !DILocation(line: 161, column: 5, scope: !96)
!114 = !DILocation(line: 162, column: 5, scope: !96)
!115 = !DILocation(line: 164, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 66, type: !19, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", scope: !116, file: !10, line: 68, type: !22)
!118 = !DILocation(line: 68, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !10, line: 69, type: !27)
!120 = !DILocation(line: 69, column: 13, scope: !116)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !10, line: 70, type: !32)
!122 = !DILocation(line: 70, column: 13, scope: !116)
!123 = !DILocation(line: 71, column: 13, scope: !116)
!124 = !DILocation(line: 71, column: 5, scope: !116)
!125 = !DILocation(line: 72, column: 5, scope: !116)
!126 = !DILocation(line: 72, column: 25, scope: !116)
!127 = !DILocation(line: 73, column: 13, scope: !116)
!128 = !DILocation(line: 73, column: 5, scope: !116)
!129 = !DILocation(line: 74, column: 5, scope: !116)
!130 = !DILocation(line: 74, column: 27, scope: !116)
!131 = !DILocation(line: 75, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !116, file: !10, line: 75, column: 8)
!133 = !DILocation(line: 75, column: 8, scope: !116)
!134 = !DILocation(line: 78, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !10, line: 76, column: 5)
!136 = !DILocation(line: 79, column: 5, scope: !135)
!137 = !DILocation(line: 83, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !10, line: 81, column: 5)
!139 = !DILocation(line: 83, column: 14, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !10, line: 86, type: !53)
!141 = distinct !DILexicalBlock(scope: !116, file: !10, line: 85, column: 5)
!142 = !DILocation(line: 86, column: 16, scope: !141)
!143 = !DILocalVariable(name: "destLen", scope: !141, file: !10, line: 86, type: !53)
!144 = !DILocation(line: 86, column: 19, scope: !141)
!145 = !DILocalVariable(name: "dest", scope: !141, file: !10, line: 87, type: !32)
!146 = !DILocation(line: 87, column: 17, scope: !141)
!147 = !DILocation(line: 88, column: 17, scope: !141)
!148 = !DILocation(line: 88, column: 9, scope: !141)
!149 = !DILocation(line: 89, column: 9, scope: !141)
!150 = !DILocation(line: 89, column: 21, scope: !141)
!151 = !DILocation(line: 90, column: 26, scope: !141)
!152 = !DILocation(line: 90, column: 19, scope: !141)
!153 = !DILocation(line: 90, column: 17, scope: !141)
!154 = !DILocation(line: 93, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !141, file: !10, line: 93, column: 9)
!156 = !DILocation(line: 93, column: 14, scope: !155)
!157 = !DILocation(line: 93, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !10, line: 93, column: 9)
!159 = !DILocation(line: 93, column: 25, scope: !158)
!160 = !DILocation(line: 93, column: 23, scope: !158)
!161 = !DILocation(line: 93, column: 9, scope: !155)
!162 = !DILocation(line: 95, column: 23, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !10, line: 94, column: 9)
!164 = !DILocation(line: 95, column: 28, scope: !163)
!165 = !DILocation(line: 95, column: 18, scope: !163)
!166 = !DILocation(line: 95, column: 13, scope: !163)
!167 = !DILocation(line: 95, column: 21, scope: !163)
!168 = !DILocation(line: 96, column: 9, scope: !163)
!169 = !DILocation(line: 93, column: 35, scope: !158)
!170 = !DILocation(line: 93, column: 9, scope: !158)
!171 = distinct !{!171, !161, !172, !86}
!172 = !DILocation(line: 96, column: 9, scope: !155)
!173 = !DILocation(line: 97, column: 9, scope: !141)
!174 = !DILocation(line: 97, column: 21, scope: !141)
!175 = !DILocation(line: 98, column: 20, scope: !141)
!176 = !DILocation(line: 98, column: 9, scope: !141)
!177 = !DILocation(line: 100, column: 1, scope: !116)
!178 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 103, type: !19, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!179 = !DILocalVariable(name: "data", scope: !178, file: !10, line: 105, type: !22)
!180 = !DILocation(line: 105, column: 15, scope: !178)
!181 = !DILocalVariable(name: "dataBadBuffer", scope: !178, file: !10, line: 106, type: !27)
!182 = !DILocation(line: 106, column: 13, scope: !178)
!183 = !DILocalVariable(name: "dataGoodBuffer", scope: !178, file: !10, line: 107, type: !32)
!184 = !DILocation(line: 107, column: 13, scope: !178)
!185 = !DILocation(line: 108, column: 13, scope: !178)
!186 = !DILocation(line: 108, column: 5, scope: !178)
!187 = !DILocation(line: 109, column: 5, scope: !178)
!188 = !DILocation(line: 109, column: 25, scope: !178)
!189 = !DILocation(line: 110, column: 13, scope: !178)
!190 = !DILocation(line: 110, column: 5, scope: !178)
!191 = !DILocation(line: 111, column: 5, scope: !178)
!192 = !DILocation(line: 111, column: 27, scope: !178)
!193 = !DILocation(line: 112, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !178, file: !10, line: 112, column: 8)
!195 = !DILocation(line: 112, column: 8, scope: !178)
!196 = !DILocation(line: 115, column: 16, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !10, line: 113, column: 5)
!198 = !DILocation(line: 115, column: 14, scope: !197)
!199 = !DILocation(line: 116, column: 5, scope: !197)
!200 = !DILocalVariable(name: "i", scope: !201, file: !10, line: 118, type: !53)
!201 = distinct !DILexicalBlock(scope: !178, file: !10, line: 117, column: 5)
!202 = !DILocation(line: 118, column: 16, scope: !201)
!203 = !DILocalVariable(name: "destLen", scope: !201, file: !10, line: 118, type: !53)
!204 = !DILocation(line: 118, column: 19, scope: !201)
!205 = !DILocalVariable(name: "dest", scope: !201, file: !10, line: 119, type: !32)
!206 = !DILocation(line: 119, column: 17, scope: !201)
!207 = !DILocation(line: 120, column: 17, scope: !201)
!208 = !DILocation(line: 120, column: 9, scope: !201)
!209 = !DILocation(line: 121, column: 9, scope: !201)
!210 = !DILocation(line: 121, column: 21, scope: !201)
!211 = !DILocation(line: 122, column: 26, scope: !201)
!212 = !DILocation(line: 122, column: 19, scope: !201)
!213 = !DILocation(line: 122, column: 17, scope: !201)
!214 = !DILocation(line: 125, column: 16, scope: !215)
!215 = distinct !DILexicalBlock(scope: !201, file: !10, line: 125, column: 9)
!216 = !DILocation(line: 125, column: 14, scope: !215)
!217 = !DILocation(line: 125, column: 21, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !10, line: 125, column: 9)
!219 = !DILocation(line: 125, column: 25, scope: !218)
!220 = !DILocation(line: 125, column: 23, scope: !218)
!221 = !DILocation(line: 125, column: 9, scope: !215)
!222 = !DILocation(line: 127, column: 23, scope: !223)
!223 = distinct !DILexicalBlock(scope: !218, file: !10, line: 126, column: 9)
!224 = !DILocation(line: 127, column: 28, scope: !223)
!225 = !DILocation(line: 127, column: 18, scope: !223)
!226 = !DILocation(line: 127, column: 13, scope: !223)
!227 = !DILocation(line: 127, column: 21, scope: !223)
!228 = !DILocation(line: 128, column: 9, scope: !223)
!229 = !DILocation(line: 125, column: 35, scope: !218)
!230 = !DILocation(line: 125, column: 9, scope: !218)
!231 = distinct !{!231, !221, !232, !86}
!232 = !DILocation(line: 128, column: 9, scope: !215)
!233 = !DILocation(line: 129, column: 9, scope: !201)
!234 = !DILocation(line: 129, column: 21, scope: !201)
!235 = !DILocation(line: 130, column: 20, scope: !201)
!236 = !DILocation(line: 130, column: 9, scope: !201)
!237 = !DILocation(line: 132, column: 1, scope: !178)
