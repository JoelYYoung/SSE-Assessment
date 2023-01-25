; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_09.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_09.c"
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !32
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !39
  %tobool = icmp ne i32 %0, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay4, i32** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !56
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx7, align 4, !dbg !58
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !60
  store i64 %call9, i64* %destLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !65
  %2 = load i64, i64* %destLen, align 8, !dbg !67
  %cmp = icmp ult i64 %1, %2, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !70
  %4 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx10 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !70
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !70
  %6 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !74
  store i32 %5, i32* %arrayidx11, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %7, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !82
  store i32 0, i32* %arrayidx12, align 4, !dbg !83
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !84
  call void @printWLine(i32* %arraydecay13), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_09_good() #0 !dbg !87 {
entry:
  call void @goodG2B1(), !dbg !88
  call void @goodG2B2(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #5, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #5, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_09_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_09_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !118
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !119
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !122
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !123
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx3, align 4, !dbg !125
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !126
  %tobool = icmp ne i32 %0, 0, !dbg !126
  br i1 %tobool, label %if.then, label %if.else, !dbg !128

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !129
  br label %if.end, !dbg !131

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !132
  store i32* %arraydecay4, i32** %data, align 8, !dbg !134
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !143
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx7, align 4, !dbg !145
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !147
  store i64 %call9, i64* %destLen, align 8, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !152
  %2 = load i64, i64* %destLen, align 8, !dbg !154
  %cmp = icmp ult i64 %1, %2, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !157
  %4 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx10 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !157
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !157
  %6 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !161
  store i32 %5, i32* %arrayidx11, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %7, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx12, align 4, !dbg !169
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* %arraydecay13), !dbg !171
  ret void, !dbg !172
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !173 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !180
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !181
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !182
  store i32 0, i32* %arrayidx, align 4, !dbg !183
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !184
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !185
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !186
  store i32 0, i32* %arrayidx3, align 4, !dbg !187
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !188
  %tobool = icmp ne i32 %0, 0, !dbg !188
  br i1 %tobool, label %if.then, label %if.end, !dbg !190

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !191
  store i32* %arraydecay4, i32** %data, align 8, !dbg !193
  br label %if.end, !dbg !194

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !195, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !200, metadata !DIExpression()), !dbg !201
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !202
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !203
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !204
  store i32 0, i32* %arrayidx7, align 4, !dbg !205
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !206
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !207
  store i64 %call9, i64* %destLen, align 8, !dbg !208
  store i64 0, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !212
  %2 = load i64, i64* %destLen, align 8, !dbg !214
  %cmp = icmp ult i64 %1, %2, !dbg !215
  br i1 %cmp, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !217
  %4 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx10 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !217
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !217
  %6 = load i64, i64* %i, align 8, !dbg !220
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !221
  store i32 %5, i32* %arrayidx11, align 4, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !224
  %inc = add i64 %7, 1, !dbg !224
  store i64 %inc, i64* %i, align 8, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !228
  store i32 0, i32* %arrayidx12, align 4, !dbg !229
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !230
  call void @printWLine(i32* %arraydecay13), !dbg !231
  ret void, !dbg !232
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_09_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 5, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 29, column: 25, scope: !11)
!35 = !DILocation(line: 30, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 27, scope: !11)
!39 = !DILocation(line: 32, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!41 = !DILocation(line: 32, column: 8, scope: !11)
!42 = !DILocation(line: 35, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 5)
!44 = !DILocation(line: 35, column: 14, scope: !43)
!45 = !DILocation(line: 36, column: 5, scope: !43)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 38, type: !48)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 38, column: 16, scope: !47)
!51 = !DILocalVariable(name: "destLen", scope: !47, file: !12, line: 38, type: !48)
!52 = !DILocation(line: 38, column: 19, scope: !47)
!53 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 39, type: !27)
!54 = !DILocation(line: 39, column: 17, scope: !47)
!55 = !DILocation(line: 40, column: 17, scope: !47)
!56 = !DILocation(line: 40, column: 9, scope: !47)
!57 = !DILocation(line: 41, column: 9, scope: !47)
!58 = !DILocation(line: 41, column: 21, scope: !47)
!59 = !DILocation(line: 42, column: 26, scope: !47)
!60 = !DILocation(line: 42, column: 19, scope: !47)
!61 = !DILocation(line: 42, column: 17, scope: !47)
!62 = !DILocation(line: 45, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !47, file: !12, line: 45, column: 9)
!64 = !DILocation(line: 45, column: 14, scope: !63)
!65 = !DILocation(line: 45, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 45, column: 9)
!67 = !DILocation(line: 45, column: 25, scope: !66)
!68 = !DILocation(line: 45, column: 23, scope: !66)
!69 = !DILocation(line: 45, column: 9, scope: !63)
!70 = !DILocation(line: 47, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !12, line: 46, column: 9)
!72 = !DILocation(line: 47, column: 28, scope: !71)
!73 = !DILocation(line: 47, column: 18, scope: !71)
!74 = !DILocation(line: 47, column: 13, scope: !71)
!75 = !DILocation(line: 47, column: 21, scope: !71)
!76 = !DILocation(line: 48, column: 9, scope: !71)
!77 = !DILocation(line: 45, column: 35, scope: !66)
!78 = !DILocation(line: 45, column: 9, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 48, column: 9, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 49, column: 9, scope: !47)
!83 = !DILocation(line: 49, column: 21, scope: !47)
!84 = !DILocation(line: 50, column: 20, scope: !47)
!85 = !DILocation(line: 50, column: 9, scope: !47)
!86 = !DILocation(line: 52, column: 1, scope: !11)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_09_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 129, column: 5, scope: !87)
!89 = !DILocation(line: 130, column: 5, scope: !87)
!90 = !DILocation(line: 131, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !92, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!19, !19, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !12, line: 143, type: !19)
!98 = !DILocation(line: 143, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !12, line: 143, type: !94)
!100 = !DILocation(line: 143, column: 27, scope: !91)
!101 = !DILocation(line: 146, column: 22, scope: !91)
!102 = !DILocation(line: 146, column: 12, scope: !91)
!103 = !DILocation(line: 146, column: 5, scope: !91)
!104 = !DILocation(line: 148, column: 5, scope: !91)
!105 = !DILocation(line: 149, column: 5, scope: !91)
!106 = !DILocation(line: 150, column: 5, scope: !91)
!107 = !DILocation(line: 153, column: 5, scope: !91)
!108 = !DILocation(line: 154, column: 5, scope: !91)
!109 = !DILocation(line: 155, column: 5, scope: !91)
!110 = !DILocation(line: 157, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !12, line: 61, type: !16)
!113 = !DILocation(line: 61, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !12, line: 62, type: !22)
!115 = !DILocation(line: 62, column: 13, scope: !111)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !12, line: 63, type: !27)
!117 = !DILocation(line: 63, column: 13, scope: !111)
!118 = !DILocation(line: 64, column: 13, scope: !111)
!119 = !DILocation(line: 64, column: 5, scope: !111)
!120 = !DILocation(line: 65, column: 5, scope: !111)
!121 = !DILocation(line: 65, column: 25, scope: !111)
!122 = !DILocation(line: 66, column: 13, scope: !111)
!123 = !DILocation(line: 66, column: 5, scope: !111)
!124 = !DILocation(line: 67, column: 5, scope: !111)
!125 = !DILocation(line: 67, column: 27, scope: !111)
!126 = !DILocation(line: 68, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !111, file: !12, line: 68, column: 8)
!128 = !DILocation(line: 68, column: 8, scope: !111)
!129 = !DILocation(line: 71, column: 9, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 69, column: 5)
!131 = !DILocation(line: 72, column: 5, scope: !130)
!132 = !DILocation(line: 76, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !12, line: 74, column: 5)
!134 = !DILocation(line: 76, column: 14, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !12, line: 79, type: !48)
!136 = distinct !DILexicalBlock(scope: !111, file: !12, line: 78, column: 5)
!137 = !DILocation(line: 79, column: 16, scope: !136)
!138 = !DILocalVariable(name: "destLen", scope: !136, file: !12, line: 79, type: !48)
!139 = !DILocation(line: 79, column: 19, scope: !136)
!140 = !DILocalVariable(name: "dest", scope: !136, file: !12, line: 80, type: !27)
!141 = !DILocation(line: 80, column: 17, scope: !136)
!142 = !DILocation(line: 81, column: 17, scope: !136)
!143 = !DILocation(line: 81, column: 9, scope: !136)
!144 = !DILocation(line: 82, column: 9, scope: !136)
!145 = !DILocation(line: 82, column: 21, scope: !136)
!146 = !DILocation(line: 83, column: 26, scope: !136)
!147 = !DILocation(line: 83, column: 19, scope: !136)
!148 = !DILocation(line: 83, column: 17, scope: !136)
!149 = !DILocation(line: 86, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !136, file: !12, line: 86, column: 9)
!151 = !DILocation(line: 86, column: 14, scope: !150)
!152 = !DILocation(line: 86, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !12, line: 86, column: 9)
!154 = !DILocation(line: 86, column: 25, scope: !153)
!155 = !DILocation(line: 86, column: 23, scope: !153)
!156 = !DILocation(line: 86, column: 9, scope: !150)
!157 = !DILocation(line: 88, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !12, line: 87, column: 9)
!159 = !DILocation(line: 88, column: 28, scope: !158)
!160 = !DILocation(line: 88, column: 18, scope: !158)
!161 = !DILocation(line: 88, column: 13, scope: !158)
!162 = !DILocation(line: 88, column: 21, scope: !158)
!163 = !DILocation(line: 89, column: 9, scope: !158)
!164 = !DILocation(line: 86, column: 35, scope: !153)
!165 = !DILocation(line: 86, column: 9, scope: !153)
!166 = distinct !{!166, !156, !167, !81}
!167 = !DILocation(line: 89, column: 9, scope: !150)
!168 = !DILocation(line: 90, column: 9, scope: !136)
!169 = !DILocation(line: 90, column: 21, scope: !136)
!170 = !DILocation(line: 91, column: 20, scope: !136)
!171 = !DILocation(line: 91, column: 9, scope: !136)
!172 = !DILocation(line: 93, column: 1, scope: !111)
!173 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 96, type: !13, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!174 = !DILocalVariable(name: "data", scope: !173, file: !12, line: 98, type: !16)
!175 = !DILocation(line: 98, column: 15, scope: !173)
!176 = !DILocalVariable(name: "dataBadBuffer", scope: !173, file: !12, line: 99, type: !22)
!177 = !DILocation(line: 99, column: 13, scope: !173)
!178 = !DILocalVariable(name: "dataGoodBuffer", scope: !173, file: !12, line: 100, type: !27)
!179 = !DILocation(line: 100, column: 13, scope: !173)
!180 = !DILocation(line: 101, column: 13, scope: !173)
!181 = !DILocation(line: 101, column: 5, scope: !173)
!182 = !DILocation(line: 102, column: 5, scope: !173)
!183 = !DILocation(line: 102, column: 25, scope: !173)
!184 = !DILocation(line: 103, column: 13, scope: !173)
!185 = !DILocation(line: 103, column: 5, scope: !173)
!186 = !DILocation(line: 104, column: 5, scope: !173)
!187 = !DILocation(line: 104, column: 27, scope: !173)
!188 = !DILocation(line: 105, column: 8, scope: !189)
!189 = distinct !DILexicalBlock(scope: !173, file: !12, line: 105, column: 8)
!190 = !DILocation(line: 105, column: 8, scope: !173)
!191 = !DILocation(line: 108, column: 16, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !12, line: 106, column: 5)
!193 = !DILocation(line: 108, column: 14, scope: !192)
!194 = !DILocation(line: 109, column: 5, scope: !192)
!195 = !DILocalVariable(name: "i", scope: !196, file: !12, line: 111, type: !48)
!196 = distinct !DILexicalBlock(scope: !173, file: !12, line: 110, column: 5)
!197 = !DILocation(line: 111, column: 16, scope: !196)
!198 = !DILocalVariable(name: "destLen", scope: !196, file: !12, line: 111, type: !48)
!199 = !DILocation(line: 111, column: 19, scope: !196)
!200 = !DILocalVariable(name: "dest", scope: !196, file: !12, line: 112, type: !27)
!201 = !DILocation(line: 112, column: 17, scope: !196)
!202 = !DILocation(line: 113, column: 17, scope: !196)
!203 = !DILocation(line: 113, column: 9, scope: !196)
!204 = !DILocation(line: 114, column: 9, scope: !196)
!205 = !DILocation(line: 114, column: 21, scope: !196)
!206 = !DILocation(line: 115, column: 26, scope: !196)
!207 = !DILocation(line: 115, column: 19, scope: !196)
!208 = !DILocation(line: 115, column: 17, scope: !196)
!209 = !DILocation(line: 118, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !196, file: !12, line: 118, column: 9)
!211 = !DILocation(line: 118, column: 14, scope: !210)
!212 = !DILocation(line: 118, column: 21, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !12, line: 118, column: 9)
!214 = !DILocation(line: 118, column: 25, scope: !213)
!215 = !DILocation(line: 118, column: 23, scope: !213)
!216 = !DILocation(line: 118, column: 9, scope: !210)
!217 = !DILocation(line: 120, column: 23, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !12, line: 119, column: 9)
!219 = !DILocation(line: 120, column: 28, scope: !218)
!220 = !DILocation(line: 120, column: 18, scope: !218)
!221 = !DILocation(line: 120, column: 13, scope: !218)
!222 = !DILocation(line: 120, column: 21, scope: !218)
!223 = !DILocation(line: 121, column: 9, scope: !218)
!224 = !DILocation(line: 118, column: 35, scope: !213)
!225 = !DILocation(line: 118, column: 9, scope: !213)
!226 = distinct !{!226, !216, !227, !81}
!227 = !DILocation(line: 121, column: 9, scope: !210)
!228 = !DILocation(line: 122, column: 9, scope: !196)
!229 = !DILocation(line: 122, column: 21, scope: !196)
!230 = !DILocation(line: 123, column: 20, scope: !196)
!231 = !DILocation(line: 123, column: 9, scope: !196)
!232 = !DILocation(line: 125, column: 1, scope: !173)
