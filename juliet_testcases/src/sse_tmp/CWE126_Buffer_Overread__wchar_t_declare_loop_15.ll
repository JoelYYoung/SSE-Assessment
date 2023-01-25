; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_15_bad() #0 !dbg !11 {
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
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay4, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !51
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx7, align 4, !dbg !53
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !55
  store i64 %call9, i64* %destLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !60
  %1 = load i64, i64* %destLen, align 8, !dbg !62
  %cmp = icmp ult i64 %0, %1, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !65
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !65
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !65
  %5 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !69
  store i32 %4, i32* %arrayidx11, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %6, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx12, align 4, !dbg !78
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !79
  call void @printWLine(i32* %arraydecay13), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_15_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #5, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #5, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_15_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_15_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !113
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !114
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !118
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx3, align 4, !dbg !120
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store i32* %arraydecay4, i32** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !131
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx7, align 4, !dbg !133
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !135
  store i64 %call9, i64* %destLen, align 8, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !140
  %1 = load i64, i64* %destLen, align 8, !dbg !142
  %cmp = icmp ult i64 %0, %1, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !145
  %3 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !145
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !145
  %5 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !149
  store i32 %4, i32* %arrayidx11, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %6, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !156
  store i32 0, i32* %arrayidx12, align 4, !dbg !157
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  call void @printWLine(i32* %arraydecay13), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !166, metadata !DIExpression()), !dbg !167
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !168
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !169
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !170
  store i32 0, i32* %arrayidx, align 4, !dbg !171
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !172
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !173
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !174
  store i32 0, i32* %arrayidx3, align 4, !dbg !175
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !176
  store i32* %arraydecay4, i32** %data, align 8, !dbg !177
  call void @llvm.dbg.declare(metadata i64* %i, metadata !178, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !183, metadata !DIExpression()), !dbg !184
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !185
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #5, !dbg !186
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !187
  store i32 0, i32* %arrayidx7, align 4, !dbg !188
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !189
  %call9 = call i64 @wcslen(i32* %arraydecay8) #6, !dbg !190
  store i64 %call9, i64* %destLen, align 8, !dbg !191
  store i64 0, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !195
  %1 = load i64, i64* %destLen, align 8, !dbg !197
  %cmp = icmp ult i64 %0, %1, !dbg !198
  br i1 %cmp, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !200
  %3 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !200
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !200
  %5 = load i64, i64* %i, align 8, !dbg !203
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !204
  store i32 %4, i32* %arrayidx11, align 4, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %6, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !211
  store i32 0, i32* %arrayidx12, align 4, !dbg !212
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !213
  call void @printWLine(i32* %arraydecay13), !dbg !214
  ret void, !dbg !215
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!39 = !DILocation(line: 36, column: 16, scope: !11)
!40 = !DILocation(line: 36, column: 14, scope: !11)
!41 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 44, type: !43)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 44, column: 16, scope: !42)
!46 = !DILocalVariable(name: "destLen", scope: !42, file: !12, line: 44, type: !43)
!47 = !DILocation(line: 44, column: 19, scope: !42)
!48 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 45, type: !27)
!49 = !DILocation(line: 45, column: 17, scope: !42)
!50 = !DILocation(line: 46, column: 17, scope: !42)
!51 = !DILocation(line: 46, column: 9, scope: !42)
!52 = !DILocation(line: 47, column: 9, scope: !42)
!53 = !DILocation(line: 47, column: 21, scope: !42)
!54 = !DILocation(line: 48, column: 26, scope: !42)
!55 = !DILocation(line: 48, column: 19, scope: !42)
!56 = !DILocation(line: 48, column: 17, scope: !42)
!57 = !DILocation(line: 51, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !42, file: !12, line: 51, column: 9)
!59 = !DILocation(line: 51, column: 14, scope: !58)
!60 = !DILocation(line: 51, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 51, column: 9)
!62 = !DILocation(line: 51, column: 25, scope: !61)
!63 = !DILocation(line: 51, column: 23, scope: !61)
!64 = !DILocation(line: 51, column: 9, scope: !58)
!65 = !DILocation(line: 53, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !12, line: 52, column: 9)
!67 = !DILocation(line: 53, column: 28, scope: !66)
!68 = !DILocation(line: 53, column: 18, scope: !66)
!69 = !DILocation(line: 53, column: 13, scope: !66)
!70 = !DILocation(line: 53, column: 21, scope: !66)
!71 = !DILocation(line: 54, column: 9, scope: !66)
!72 = !DILocation(line: 51, column: 35, scope: !61)
!73 = !DILocation(line: 51, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 54, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 55, column: 9, scope: !42)
!78 = !DILocation(line: 55, column: 21, scope: !42)
!79 = !DILocation(line: 56, column: 20, scope: !42)
!80 = !DILocation(line: 56, column: 9, scope: !42)
!81 = !DILocation(line: 58, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_15_good", scope: !12, file: !12, line: 140, type: !13, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 142, column: 5, scope: !82)
!84 = !DILocation(line: 143, column: 5, scope: !82)
!85 = !DILocation(line: 144, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 156, type: !87, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!19, !19, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !12, line: 156, type: !19)
!93 = !DILocation(line: 156, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !12, line: 156, type: !89)
!95 = !DILocation(line: 156, column: 27, scope: !86)
!96 = !DILocation(line: 159, column: 22, scope: !86)
!97 = !DILocation(line: 159, column: 12, scope: !86)
!98 = !DILocation(line: 159, column: 5, scope: !86)
!99 = !DILocation(line: 161, column: 5, scope: !86)
!100 = !DILocation(line: 162, column: 5, scope: !86)
!101 = !DILocation(line: 163, column: 5, scope: !86)
!102 = !DILocation(line: 166, column: 5, scope: !86)
!103 = !DILocation(line: 167, column: 5, scope: !86)
!104 = !DILocation(line: 168, column: 5, scope: !86)
!105 = !DILocation(line: 170, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 67, type: !16)
!108 = !DILocation(line: 67, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !12, line: 68, type: !22)
!110 = !DILocation(line: 68, column: 13, scope: !106)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !12, line: 69, type: !27)
!112 = !DILocation(line: 69, column: 13, scope: !106)
!113 = !DILocation(line: 70, column: 13, scope: !106)
!114 = !DILocation(line: 70, column: 5, scope: !106)
!115 = !DILocation(line: 71, column: 5, scope: !106)
!116 = !DILocation(line: 71, column: 25, scope: !106)
!117 = !DILocation(line: 72, column: 13, scope: !106)
!118 = !DILocation(line: 72, column: 5, scope: !106)
!119 = !DILocation(line: 73, column: 5, scope: !106)
!120 = !DILocation(line: 73, column: 27, scope: !106)
!121 = !DILocation(line: 82, column: 16, scope: !106)
!122 = !DILocation(line: 82, column: 14, scope: !106)
!123 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 86, type: !43)
!124 = distinct !DILexicalBlock(scope: !106, file: !12, line: 85, column: 5)
!125 = !DILocation(line: 86, column: 16, scope: !124)
!126 = !DILocalVariable(name: "destLen", scope: !124, file: !12, line: 86, type: !43)
!127 = !DILocation(line: 86, column: 19, scope: !124)
!128 = !DILocalVariable(name: "dest", scope: !124, file: !12, line: 87, type: !27)
!129 = !DILocation(line: 87, column: 17, scope: !124)
!130 = !DILocation(line: 88, column: 17, scope: !124)
!131 = !DILocation(line: 88, column: 9, scope: !124)
!132 = !DILocation(line: 89, column: 9, scope: !124)
!133 = !DILocation(line: 89, column: 21, scope: !124)
!134 = !DILocation(line: 90, column: 26, scope: !124)
!135 = !DILocation(line: 90, column: 19, scope: !124)
!136 = !DILocation(line: 90, column: 17, scope: !124)
!137 = !DILocation(line: 93, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !124, file: !12, line: 93, column: 9)
!139 = !DILocation(line: 93, column: 14, scope: !138)
!140 = !DILocation(line: 93, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !12, line: 93, column: 9)
!142 = !DILocation(line: 93, column: 25, scope: !141)
!143 = !DILocation(line: 93, column: 23, scope: !141)
!144 = !DILocation(line: 93, column: 9, scope: !138)
!145 = !DILocation(line: 95, column: 23, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !12, line: 94, column: 9)
!147 = !DILocation(line: 95, column: 28, scope: !146)
!148 = !DILocation(line: 95, column: 18, scope: !146)
!149 = !DILocation(line: 95, column: 13, scope: !146)
!150 = !DILocation(line: 95, column: 21, scope: !146)
!151 = !DILocation(line: 96, column: 9, scope: !146)
!152 = !DILocation(line: 93, column: 35, scope: !141)
!153 = !DILocation(line: 93, column: 9, scope: !141)
!154 = distinct !{!154, !144, !155, !76}
!155 = !DILocation(line: 96, column: 9, scope: !138)
!156 = !DILocation(line: 97, column: 9, scope: !124)
!157 = !DILocation(line: 97, column: 21, scope: !124)
!158 = !DILocation(line: 98, column: 20, scope: !124)
!159 = !DILocation(line: 98, column: 9, scope: !124)
!160 = !DILocation(line: 100, column: 1, scope: !106)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DILocalVariable(name: "data", scope: !161, file: !12, line: 105, type: !16)
!163 = !DILocation(line: 105, column: 15, scope: !161)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !12, line: 106, type: !22)
!165 = !DILocation(line: 106, column: 13, scope: !161)
!166 = !DILocalVariable(name: "dataGoodBuffer", scope: !161, file: !12, line: 107, type: !27)
!167 = !DILocation(line: 107, column: 13, scope: !161)
!168 = !DILocation(line: 108, column: 13, scope: !161)
!169 = !DILocation(line: 108, column: 5, scope: !161)
!170 = !DILocation(line: 109, column: 5, scope: !161)
!171 = !DILocation(line: 109, column: 25, scope: !161)
!172 = !DILocation(line: 110, column: 13, scope: !161)
!173 = !DILocation(line: 110, column: 5, scope: !161)
!174 = !DILocation(line: 111, column: 5, scope: !161)
!175 = !DILocation(line: 111, column: 27, scope: !161)
!176 = !DILocation(line: 116, column: 16, scope: !161)
!177 = !DILocation(line: 116, column: 14, scope: !161)
!178 = !DILocalVariable(name: "i", scope: !179, file: !12, line: 124, type: !43)
!179 = distinct !DILexicalBlock(scope: !161, file: !12, line: 123, column: 5)
!180 = !DILocation(line: 124, column: 16, scope: !179)
!181 = !DILocalVariable(name: "destLen", scope: !179, file: !12, line: 124, type: !43)
!182 = !DILocation(line: 124, column: 19, scope: !179)
!183 = !DILocalVariable(name: "dest", scope: !179, file: !12, line: 125, type: !27)
!184 = !DILocation(line: 125, column: 17, scope: !179)
!185 = !DILocation(line: 126, column: 17, scope: !179)
!186 = !DILocation(line: 126, column: 9, scope: !179)
!187 = !DILocation(line: 127, column: 9, scope: !179)
!188 = !DILocation(line: 127, column: 21, scope: !179)
!189 = !DILocation(line: 128, column: 26, scope: !179)
!190 = !DILocation(line: 128, column: 19, scope: !179)
!191 = !DILocation(line: 128, column: 17, scope: !179)
!192 = !DILocation(line: 131, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !179, file: !12, line: 131, column: 9)
!194 = !DILocation(line: 131, column: 14, scope: !193)
!195 = !DILocation(line: 131, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !12, line: 131, column: 9)
!197 = !DILocation(line: 131, column: 25, scope: !196)
!198 = !DILocation(line: 131, column: 23, scope: !196)
!199 = !DILocation(line: 131, column: 9, scope: !193)
!200 = !DILocation(line: 133, column: 23, scope: !201)
!201 = distinct !DILexicalBlock(scope: !196, file: !12, line: 132, column: 9)
!202 = !DILocation(line: 133, column: 28, scope: !201)
!203 = !DILocation(line: 133, column: 18, scope: !201)
!204 = !DILocation(line: 133, column: 13, scope: !201)
!205 = !DILocation(line: 133, column: 21, scope: !201)
!206 = !DILocation(line: 134, column: 9, scope: !201)
!207 = !DILocation(line: 131, column: 35, scope: !196)
!208 = !DILocation(line: 131, column: 9, scope: !196)
!209 = distinct !{!209, !199, !210, !76}
!210 = !DILocation(line: 134, column: 9, scope: !193)
!211 = !DILocation(line: 135, column: 9, scope: !179)
!212 = !DILocation(line: 135, column: 21, scope: !179)
!213 = !DILocation(line: 136, column: 20, scope: !179)
!214 = !DILocation(line: 136, column: 9, scope: !179)
!215 = !DILocation(line: 138, column: 1, scope: !161)
