; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_08_bad() #0 !dbg !11 {
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
  %call4 = call i32 @staticReturnsTrue(), !dbg !39
  %tobool = icmp ne i32 %call4, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay5, i32** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #5, !dbg !56
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx8, align 4, !dbg !58
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call10 = call i64 @wcslen(i32* %arraydecay9) #6, !dbg !60
  store i64 %call10, i64* %destLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !65
  %1 = load i64, i64* %destLen, align 8, !dbg !67
  %cmp = icmp ult i64 %0, %1, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !70
  %3 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx11 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !70
  %4 = load i32, i32* %arrayidx11, align 4, !dbg !70
  %5 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !74
  store i32 %4, i32* %arrayidx12, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %6, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !82
  store i32 0, i32* %arrayidx13, align 4, !dbg !83
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !84
  call void @printWLine(i32* %arraydecay14), !dbg !85
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_08_good() #0 !dbg !87 {
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
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_08_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_08_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !111 {
entry:
  ret i32 1, !dbg !114
}

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
  %call4 = call i32 @staticReturnsFalse(), !dbg !130
  %tobool = icmp ne i32 %call4, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.else, !dbg !132

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !133
  br label %if.end, !dbg !135

if.else:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !136
  store i32* %arraydecay5, i32** %data, align 8, !dbg !138
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #5, !dbg !147
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx8, align 4, !dbg !149
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  %call10 = call i64 @wcslen(i32* %arraydecay9) #6, !dbg !151
  store i64 %call10, i64* %destLen, align 8, !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !156
  %1 = load i64, i64* %destLen, align 8, !dbg !158
  %cmp = icmp ult i64 %0, %1, !dbg !159
  br i1 %cmp, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !161
  %3 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx11 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !161
  %4 = load i32, i32* %arrayidx11, align 4, !dbg !161
  %5 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !165
  store i32 %4, i32* %arrayidx12, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !168
  %inc = add i64 %6, 1, !dbg !168
  store i64 %inc, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !172
  store i32 0, i32* %arrayidx13, align 4, !dbg !173
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !174
  call void @printWLine(i32* %arraydecay14), !dbg !175
  ret void, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !177 {
entry:
  ret i32 0, !dbg !178
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !179 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !182, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !184, metadata !DIExpression()), !dbg !185
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !186
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !187
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !188
  store i32 0, i32* %arrayidx, align 4, !dbg !189
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !190
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !191
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !192
  store i32 0, i32* %arrayidx3, align 4, !dbg !193
  %call4 = call i32 @staticReturnsTrue(), !dbg !194
  %tobool = icmp ne i32 %call4, 0, !dbg !194
  br i1 %tobool, label %if.then, label %if.end, !dbg !196

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !197
  store i32* %arraydecay5, i32** %data, align 8, !dbg !199
  br label %if.end, !dbg !200

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !201, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !204, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !206, metadata !DIExpression()), !dbg !207
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !208
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #5, !dbg !209
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !210
  store i32 0, i32* %arrayidx8, align 4, !dbg !211
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !212
  %call10 = call i64 @wcslen(i32* %arraydecay9) #6, !dbg !213
  store i64 %call10, i64* %destLen, align 8, !dbg !214
  store i64 0, i64* %i, align 8, !dbg !215
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !218
  %1 = load i64, i64* %destLen, align 8, !dbg !220
  %cmp = icmp ult i64 %0, %1, !dbg !221
  br i1 %cmp, label %for.body, label %for.end, !dbg !222

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !223
  %3 = load i64, i64* %i, align 8, !dbg !225
  %arrayidx11 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !223
  %4 = load i32, i32* %arrayidx11, align 4, !dbg !223
  %5 = load i64, i64* %i, align 8, !dbg !226
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !227
  store i32 %4, i32* %arrayidx12, align 4, !dbg !228
  br label %for.inc, !dbg !229

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !230
  %inc = add i64 %6, 1, !dbg !230
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 41, column: 13, scope: !11)
!31 = !DILocation(line: 42, column: 13, scope: !11)
!32 = !DILocation(line: 42, column: 5, scope: !11)
!33 = !DILocation(line: 43, column: 5, scope: !11)
!34 = !DILocation(line: 43, column: 25, scope: !11)
!35 = !DILocation(line: 44, column: 13, scope: !11)
!36 = !DILocation(line: 44, column: 5, scope: !11)
!37 = !DILocation(line: 45, column: 5, scope: !11)
!38 = !DILocation(line: 45, column: 27, scope: !11)
!39 = !DILocation(line: 46, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 8)
!41 = !DILocation(line: 46, column: 8, scope: !11)
!42 = !DILocation(line: 49, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 47, column: 5)
!44 = !DILocation(line: 49, column: 14, scope: !43)
!45 = !DILocation(line: 50, column: 5, scope: !43)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 52, type: !48)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 51, column: 5)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 52, column: 16, scope: !47)
!51 = !DILocalVariable(name: "destLen", scope: !47, file: !12, line: 52, type: !48)
!52 = !DILocation(line: 52, column: 19, scope: !47)
!53 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 53, type: !27)
!54 = !DILocation(line: 53, column: 17, scope: !47)
!55 = !DILocation(line: 54, column: 17, scope: !47)
!56 = !DILocation(line: 54, column: 9, scope: !47)
!57 = !DILocation(line: 55, column: 9, scope: !47)
!58 = !DILocation(line: 55, column: 21, scope: !47)
!59 = !DILocation(line: 56, column: 26, scope: !47)
!60 = !DILocation(line: 56, column: 19, scope: !47)
!61 = !DILocation(line: 56, column: 17, scope: !47)
!62 = !DILocation(line: 59, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !47, file: !12, line: 59, column: 9)
!64 = !DILocation(line: 59, column: 14, scope: !63)
!65 = !DILocation(line: 59, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 59, column: 9)
!67 = !DILocation(line: 59, column: 25, scope: !66)
!68 = !DILocation(line: 59, column: 23, scope: !66)
!69 = !DILocation(line: 59, column: 9, scope: !63)
!70 = !DILocation(line: 61, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !12, line: 60, column: 9)
!72 = !DILocation(line: 61, column: 28, scope: !71)
!73 = !DILocation(line: 61, column: 18, scope: !71)
!74 = !DILocation(line: 61, column: 13, scope: !71)
!75 = !DILocation(line: 61, column: 21, scope: !71)
!76 = !DILocation(line: 62, column: 9, scope: !71)
!77 = !DILocation(line: 59, column: 35, scope: !66)
!78 = !DILocation(line: 59, column: 9, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 62, column: 9, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 63, column: 9, scope: !47)
!83 = !DILocation(line: 63, column: 21, scope: !47)
!84 = !DILocation(line: 64, column: 20, scope: !47)
!85 = !DILocation(line: 64, column: 9, scope: !47)
!86 = !DILocation(line: 66, column: 1, scope: !11)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_08_good", scope: !12, file: !12, line: 141, type: !13, scopeLine: 142, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 143, column: 5, scope: !87)
!89 = !DILocation(line: 144, column: 5, scope: !87)
!90 = !DILocation(line: 145, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 157, type: !92, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!19, !19, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !12, line: 157, type: !19)
!98 = !DILocation(line: 157, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !12, line: 157, type: !94)
!100 = !DILocation(line: 157, column: 27, scope: !91)
!101 = !DILocation(line: 160, column: 22, scope: !91)
!102 = !DILocation(line: 160, column: 12, scope: !91)
!103 = !DILocation(line: 160, column: 5, scope: !91)
!104 = !DILocation(line: 162, column: 5, scope: !91)
!105 = !DILocation(line: 163, column: 5, scope: !91)
!106 = !DILocation(line: 164, column: 5, scope: !91)
!107 = !DILocation(line: 167, column: 5, scope: !91)
!108 = !DILocation(line: 168, column: 5, scope: !91)
!109 = !DILocation(line: 169, column: 5, scope: !91)
!110 = !DILocation(line: 171, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !112, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DISubroutineType(types: !113)
!113 = !{!19}
!114 = !DILocation(line: 27, column: 5, scope: !111)
!115 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !12, line: 75, type: !16)
!117 = !DILocation(line: 75, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !12, line: 76, type: !22)
!119 = !DILocation(line: 76, column: 13, scope: !115)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !12, line: 77, type: !27)
!121 = !DILocation(line: 77, column: 13, scope: !115)
!122 = !DILocation(line: 78, column: 13, scope: !115)
!123 = !DILocation(line: 78, column: 5, scope: !115)
!124 = !DILocation(line: 79, column: 5, scope: !115)
!125 = !DILocation(line: 79, column: 25, scope: !115)
!126 = !DILocation(line: 80, column: 13, scope: !115)
!127 = !DILocation(line: 80, column: 5, scope: !115)
!128 = !DILocation(line: 81, column: 5, scope: !115)
!129 = !DILocation(line: 81, column: 27, scope: !115)
!130 = !DILocation(line: 82, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !115, file: !12, line: 82, column: 8)
!132 = !DILocation(line: 82, column: 8, scope: !115)
!133 = !DILocation(line: 85, column: 9, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 83, column: 5)
!135 = !DILocation(line: 86, column: 5, scope: !134)
!136 = !DILocation(line: 90, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !12, line: 88, column: 5)
!138 = !DILocation(line: 90, column: 14, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !12, line: 93, type: !48)
!140 = distinct !DILexicalBlock(scope: !115, file: !12, line: 92, column: 5)
!141 = !DILocation(line: 93, column: 16, scope: !140)
!142 = !DILocalVariable(name: "destLen", scope: !140, file: !12, line: 93, type: !48)
!143 = !DILocation(line: 93, column: 19, scope: !140)
!144 = !DILocalVariable(name: "dest", scope: !140, file: !12, line: 94, type: !27)
!145 = !DILocation(line: 94, column: 17, scope: !140)
!146 = !DILocation(line: 95, column: 17, scope: !140)
!147 = !DILocation(line: 95, column: 9, scope: !140)
!148 = !DILocation(line: 96, column: 9, scope: !140)
!149 = !DILocation(line: 96, column: 21, scope: !140)
!150 = !DILocation(line: 97, column: 26, scope: !140)
!151 = !DILocation(line: 97, column: 19, scope: !140)
!152 = !DILocation(line: 97, column: 17, scope: !140)
!153 = !DILocation(line: 100, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !140, file: !12, line: 100, column: 9)
!155 = !DILocation(line: 100, column: 14, scope: !154)
!156 = !DILocation(line: 100, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !12, line: 100, column: 9)
!158 = !DILocation(line: 100, column: 25, scope: !157)
!159 = !DILocation(line: 100, column: 23, scope: !157)
!160 = !DILocation(line: 100, column: 9, scope: !154)
!161 = !DILocation(line: 102, column: 23, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !12, line: 101, column: 9)
!163 = !DILocation(line: 102, column: 28, scope: !162)
!164 = !DILocation(line: 102, column: 18, scope: !162)
!165 = !DILocation(line: 102, column: 13, scope: !162)
!166 = !DILocation(line: 102, column: 21, scope: !162)
!167 = !DILocation(line: 103, column: 9, scope: !162)
!168 = !DILocation(line: 100, column: 35, scope: !157)
!169 = !DILocation(line: 100, column: 9, scope: !157)
!170 = distinct !{!170, !160, !171, !81}
!171 = !DILocation(line: 103, column: 9, scope: !154)
!172 = !DILocation(line: 104, column: 9, scope: !140)
!173 = !DILocation(line: 104, column: 21, scope: !140)
!174 = !DILocation(line: 105, column: 20, scope: !140)
!175 = !DILocation(line: 105, column: 9, scope: !140)
!176 = !DILocation(line: 107, column: 1, scope: !115)
!177 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !112, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!178 = !DILocation(line: 32, column: 5, scope: !177)
!179 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 110, type: !13, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!180 = !DILocalVariable(name: "data", scope: !179, file: !12, line: 112, type: !16)
!181 = !DILocation(line: 112, column: 15, scope: !179)
!182 = !DILocalVariable(name: "dataBadBuffer", scope: !179, file: !12, line: 113, type: !22)
!183 = !DILocation(line: 113, column: 13, scope: !179)
!184 = !DILocalVariable(name: "dataGoodBuffer", scope: !179, file: !12, line: 114, type: !27)
!185 = !DILocation(line: 114, column: 13, scope: !179)
!186 = !DILocation(line: 115, column: 13, scope: !179)
!187 = !DILocation(line: 115, column: 5, scope: !179)
!188 = !DILocation(line: 116, column: 5, scope: !179)
!189 = !DILocation(line: 116, column: 25, scope: !179)
!190 = !DILocation(line: 117, column: 13, scope: !179)
!191 = !DILocation(line: 117, column: 5, scope: !179)
!192 = !DILocation(line: 118, column: 5, scope: !179)
!193 = !DILocation(line: 118, column: 27, scope: !179)
!194 = !DILocation(line: 119, column: 8, scope: !195)
!195 = distinct !DILexicalBlock(scope: !179, file: !12, line: 119, column: 8)
!196 = !DILocation(line: 119, column: 8, scope: !179)
!197 = !DILocation(line: 122, column: 16, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !12, line: 120, column: 5)
!199 = !DILocation(line: 122, column: 14, scope: !198)
!200 = !DILocation(line: 123, column: 5, scope: !198)
!201 = !DILocalVariable(name: "i", scope: !202, file: !12, line: 125, type: !48)
!202 = distinct !DILexicalBlock(scope: !179, file: !12, line: 124, column: 5)
!203 = !DILocation(line: 125, column: 16, scope: !202)
!204 = !DILocalVariable(name: "destLen", scope: !202, file: !12, line: 125, type: !48)
!205 = !DILocation(line: 125, column: 19, scope: !202)
!206 = !DILocalVariable(name: "dest", scope: !202, file: !12, line: 126, type: !27)
!207 = !DILocation(line: 126, column: 17, scope: !202)
!208 = !DILocation(line: 127, column: 17, scope: !202)
!209 = !DILocation(line: 127, column: 9, scope: !202)
!210 = !DILocation(line: 128, column: 9, scope: !202)
!211 = !DILocation(line: 128, column: 21, scope: !202)
!212 = !DILocation(line: 129, column: 26, scope: !202)
!213 = !DILocation(line: 129, column: 19, scope: !202)
!214 = !DILocation(line: 129, column: 17, scope: !202)
!215 = !DILocation(line: 132, column: 16, scope: !216)
!216 = distinct !DILexicalBlock(scope: !202, file: !12, line: 132, column: 9)
!217 = !DILocation(line: 132, column: 14, scope: !216)
!218 = !DILocation(line: 132, column: 21, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !12, line: 132, column: 9)
!220 = !DILocation(line: 132, column: 25, scope: !219)
!221 = !DILocation(line: 132, column: 23, scope: !219)
!222 = !DILocation(line: 132, column: 9, scope: !216)
!223 = !DILocation(line: 134, column: 23, scope: !224)
!224 = distinct !DILexicalBlock(scope: !219, file: !12, line: 133, column: 9)
!225 = !DILocation(line: 134, column: 28, scope: !224)
!226 = !DILocation(line: 134, column: 18, scope: !224)
!227 = !DILocation(line: 134, column: 13, scope: !224)
!228 = !DILocation(line: 134, column: 21, scope: !224)
!229 = !DILocation(line: 135, column: 9, scope: !224)
!230 = !DILocation(line: 132, column: 35, scope: !219)
!231 = !DILocation(line: 132, column: 9, scope: !219)
!232 = distinct !{!232, !222, !233, !81}
!233 = !DILocation(line: 135, column: 9, scope: !216)
!234 = !DILocation(line: 136, column: 9, scope: !202)
!235 = !DILocation(line: 136, column: 21, scope: !202)
!236 = !DILocation(line: 137, column: 20, scope: !202)
!237 = !DILocation(line: 137, column: 9, scope: !202)
!238 = !DILocation(line: 139, column: 1, scope: !179)
