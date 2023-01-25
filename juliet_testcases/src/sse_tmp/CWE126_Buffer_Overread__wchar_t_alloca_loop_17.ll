; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i3 = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 200, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 400, align 16, !dbg !29
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !28
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !32
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !36
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !37
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !37
  store i32 0, i32* %arrayidx2, align 4, !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %i, align 4, !dbg !42
  %cmp = icmp slt i32 %8, 1, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !46
  store i32* %9, i32** %data, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %10, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !55, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !62, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !68
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx5, align 4, !dbg !70
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !71
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !72
  store i64 %call7, i64* %destLen, align 8, !dbg !73
  store i64 0, i64* %i3, align 8, !dbg !74
  br label %for.cond8, !dbg !76

for.cond8:                                        ; preds = %for.inc13, %for.end
  %11 = load i64, i64* %i3, align 8, !dbg !77
  %12 = load i64, i64* %destLen, align 8, !dbg !79
  %cmp9 = icmp ult i64 %11, %12, !dbg !80
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !81

for.body10:                                       ; preds = %for.cond8
  %13 = load i32*, i32** %data, align 8, !dbg !82
  %14 = load i64, i64* %i3, align 8, !dbg !84
  %arrayidx11 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !82
  %15 = load i32, i32* %arrayidx11, align 4, !dbg !82
  %16 = load i64, i64* %i3, align 8, !dbg !85
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %16, !dbg !86
  store i32 %15, i32* %arrayidx12, align 4, !dbg !87
  br label %for.inc13, !dbg !88

for.inc13:                                        ; preds = %for.body10
  %17 = load i64, i64* %i3, align 8, !dbg !89
  %inc14 = add i64 %17, 1, !dbg !89
  store i64 %inc14, i64* %i3, align 8, !dbg !89
  br label %for.cond8, !dbg !90, !llvm.loop !91

for.end15:                                        ; preds = %for.cond8
  %arrayidx16 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !93
  store i32 0, i32* %arrayidx16, align 4, !dbg !94
  %arraydecay17 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !95
  call void @printWLine(i32* %arraydecay17), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_17_good() #0 !dbg !98 {
entry:
  call void @goodG2B(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* null) #5, !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #5, !dbg !113
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_17_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_17_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !121 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %0 = alloca i8, i64 200, align 16, !dbg !128
  %1 = bitcast i8* %0 to i32*, !dbg !129
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %2 = alloca i8, i64 400, align 16, !dbg !132
  %3 = bitcast i8* %2 to i32*, !dbg !133
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !131
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !134
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !135
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !138
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !139
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !140
  store i32 0, i32* %arrayidx2, align 4, !dbg !141
  store i32 0, i32* %h, align 4, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %h, align 4, !dbg !145
  %cmp = icmp slt i32 %8, 1, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !149
  store i32* %9, i32** %data, align 8, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %h, align 4, !dbg !153
  %inc = add nsw i32 %10, 1, !dbg !153
  store i32 %inc, i32* %h, align 4, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !162, metadata !DIExpression()), !dbg !163
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !165
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !166
  store i32 0, i32* %arrayidx4, align 4, !dbg !167
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  %call6 = call i64 @wcslen(i32* %arraydecay5) #6, !dbg !169
  store i64 %call6, i64* %destLen, align 8, !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond7, !dbg !173

for.cond7:                                        ; preds = %for.inc12, %for.end
  %11 = load i64, i64* %i, align 8, !dbg !174
  %12 = load i64, i64* %destLen, align 8, !dbg !176
  %cmp8 = icmp ult i64 %11, %12, !dbg !177
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !178

for.body9:                                        ; preds = %for.cond7
  %13 = load i32*, i32** %data, align 8, !dbg !179
  %14 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx10 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !179
  %15 = load i32, i32* %arrayidx10, align 4, !dbg !179
  %16 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %16, !dbg !183
  store i32 %15, i32* %arrayidx11, align 4, !dbg !184
  br label %for.inc12, !dbg !185

for.inc12:                                        ; preds = %for.body9
  %17 = load i64, i64* %i, align 8, !dbg !186
  %inc13 = add i64 %17, 1, !dbg !186
  store i64 %inc13, i64* %i, align 8, !dbg !186
  br label %for.cond7, !dbg !187, !llvm.loop !188

for.end14:                                        ; preds = %for.cond7
  %arrayidx15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !190
  store i32 0, i32* %arrayidx15, align 4, !dbg !191
  %arraydecay16 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !192
  call void @printWLine(i32* %arraydecay16), !dbg !193
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_17_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 25, type: !7)
!20 = !DILocation(line: 25, column: 9, scope: !15)
!21 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 27, type: !4)
!24 = !DILocation(line: 27, column: 15, scope: !15)
!25 = !DILocation(line: 27, column: 42, scope: !15)
!26 = !DILocation(line: 27, column: 31, scope: !15)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 28, type: !4)
!28 = !DILocation(line: 28, column: 15, scope: !15)
!29 = !DILocation(line: 28, column: 43, scope: !15)
!30 = !DILocation(line: 28, column: 32, scope: !15)
!31 = !DILocation(line: 29, column: 13, scope: !15)
!32 = !DILocation(line: 29, column: 5, scope: !15)
!33 = !DILocation(line: 30, column: 5, scope: !15)
!34 = !DILocation(line: 30, column: 25, scope: !15)
!35 = !DILocation(line: 31, column: 13, scope: !15)
!36 = !DILocation(line: 31, column: 5, scope: !15)
!37 = !DILocation(line: 32, column: 5, scope: !15)
!38 = !DILocation(line: 32, column: 27, scope: !15)
!39 = !DILocation(line: 33, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 5)
!41 = !DILocation(line: 33, column: 9, scope: !40)
!42 = !DILocation(line: 33, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !16, line: 33, column: 5)
!44 = !DILocation(line: 33, column: 18, scope: !43)
!45 = !DILocation(line: 33, column: 5, scope: !40)
!46 = !DILocation(line: 36, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !16, line: 34, column: 5)
!48 = !DILocation(line: 36, column: 14, scope: !47)
!49 = !DILocation(line: 37, column: 5, scope: !47)
!50 = !DILocation(line: 33, column: 24, scope: !43)
!51 = !DILocation(line: 33, column: 5, scope: !43)
!52 = distinct !{!52, !45, !53, !54}
!53 = !DILocation(line: 37, column: 5, scope: !40)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocalVariable(name: "i", scope: !56, file: !16, line: 39, type: !57)
!56 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !58)
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 39, column: 16, scope: !56)
!60 = !DILocalVariable(name: "destLen", scope: !56, file: !16, line: 39, type: !57)
!61 = !DILocation(line: 39, column: 19, scope: !56)
!62 = !DILocalVariable(name: "dest", scope: !56, file: !16, line: 40, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 100)
!66 = !DILocation(line: 40, column: 17, scope: !56)
!67 = !DILocation(line: 41, column: 17, scope: !56)
!68 = !DILocation(line: 41, column: 9, scope: !56)
!69 = !DILocation(line: 42, column: 9, scope: !56)
!70 = !DILocation(line: 42, column: 21, scope: !56)
!71 = !DILocation(line: 43, column: 26, scope: !56)
!72 = !DILocation(line: 43, column: 19, scope: !56)
!73 = !DILocation(line: 43, column: 17, scope: !56)
!74 = !DILocation(line: 46, column: 16, scope: !75)
!75 = distinct !DILexicalBlock(scope: !56, file: !16, line: 46, column: 9)
!76 = !DILocation(line: 46, column: 14, scope: !75)
!77 = !DILocation(line: 46, column: 21, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !16, line: 46, column: 9)
!79 = !DILocation(line: 46, column: 25, scope: !78)
!80 = !DILocation(line: 46, column: 23, scope: !78)
!81 = !DILocation(line: 46, column: 9, scope: !75)
!82 = !DILocation(line: 48, column: 23, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !16, line: 47, column: 9)
!84 = !DILocation(line: 48, column: 28, scope: !83)
!85 = !DILocation(line: 48, column: 18, scope: !83)
!86 = !DILocation(line: 48, column: 13, scope: !83)
!87 = !DILocation(line: 48, column: 21, scope: !83)
!88 = !DILocation(line: 49, column: 9, scope: !83)
!89 = !DILocation(line: 46, column: 35, scope: !78)
!90 = !DILocation(line: 46, column: 9, scope: !78)
!91 = distinct !{!91, !81, !92, !54}
!92 = !DILocation(line: 49, column: 9, scope: !75)
!93 = !DILocation(line: 50, column: 9, scope: !56)
!94 = !DILocation(line: 50, column: 21, scope: !56)
!95 = !DILocation(line: 51, column: 20, scope: !56)
!96 = !DILocation(line: 51, column: 9, scope: !56)
!97 = !DILocation(line: 53, column: 1, scope: !15)
!98 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_17_good", scope: !16, file: !16, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocation(line: 94, column: 5, scope: !98)
!100 = !DILocation(line: 95, column: 1, scope: !98)
!101 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 107, type: !102, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!7, !7, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !16, line: 107, type: !7)
!108 = !DILocation(line: 107, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !16, line: 107, type: !104)
!110 = !DILocation(line: 107, column: 27, scope: !101)
!111 = !DILocation(line: 110, column: 22, scope: !101)
!112 = !DILocation(line: 110, column: 12, scope: !101)
!113 = !DILocation(line: 110, column: 5, scope: !101)
!114 = !DILocation(line: 112, column: 5, scope: !101)
!115 = !DILocation(line: 113, column: 5, scope: !101)
!116 = !DILocation(line: 114, column: 5, scope: !101)
!117 = !DILocation(line: 117, column: 5, scope: !101)
!118 = !DILocation(line: 118, column: 5, scope: !101)
!119 = !DILocation(line: 119, column: 5, scope: !101)
!120 = !DILocation(line: 121, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "h", scope: !121, file: !16, line: 62, type: !7)
!123 = !DILocation(line: 62, column: 9, scope: !121)
!124 = !DILocalVariable(name: "data", scope: !121, file: !16, line: 63, type: !4)
!125 = !DILocation(line: 63, column: 15, scope: !121)
!126 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !16, line: 64, type: !4)
!127 = !DILocation(line: 64, column: 15, scope: !121)
!128 = !DILocation(line: 64, column: 42, scope: !121)
!129 = !DILocation(line: 64, column: 31, scope: !121)
!130 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !16, line: 65, type: !4)
!131 = !DILocation(line: 65, column: 15, scope: !121)
!132 = !DILocation(line: 65, column: 43, scope: !121)
!133 = !DILocation(line: 65, column: 32, scope: !121)
!134 = !DILocation(line: 66, column: 13, scope: !121)
!135 = !DILocation(line: 66, column: 5, scope: !121)
!136 = !DILocation(line: 67, column: 5, scope: !121)
!137 = !DILocation(line: 67, column: 25, scope: !121)
!138 = !DILocation(line: 68, column: 13, scope: !121)
!139 = !DILocation(line: 68, column: 5, scope: !121)
!140 = !DILocation(line: 69, column: 5, scope: !121)
!141 = !DILocation(line: 69, column: 27, scope: !121)
!142 = !DILocation(line: 70, column: 11, scope: !143)
!143 = distinct !DILexicalBlock(scope: !121, file: !16, line: 70, column: 5)
!144 = !DILocation(line: 70, column: 9, scope: !143)
!145 = !DILocation(line: 70, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !16, line: 70, column: 5)
!147 = !DILocation(line: 70, column: 18, scope: !146)
!148 = !DILocation(line: 70, column: 5, scope: !143)
!149 = !DILocation(line: 73, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !16, line: 71, column: 5)
!151 = !DILocation(line: 73, column: 14, scope: !150)
!152 = !DILocation(line: 74, column: 5, scope: !150)
!153 = !DILocation(line: 70, column: 24, scope: !146)
!154 = !DILocation(line: 70, column: 5, scope: !146)
!155 = distinct !{!155, !148, !156, !54}
!156 = !DILocation(line: 74, column: 5, scope: !143)
!157 = !DILocalVariable(name: "i", scope: !158, file: !16, line: 76, type: !57)
!158 = distinct !DILexicalBlock(scope: !121, file: !16, line: 75, column: 5)
!159 = !DILocation(line: 76, column: 16, scope: !158)
!160 = !DILocalVariable(name: "destLen", scope: !158, file: !16, line: 76, type: !57)
!161 = !DILocation(line: 76, column: 19, scope: !158)
!162 = !DILocalVariable(name: "dest", scope: !158, file: !16, line: 77, type: !63)
!163 = !DILocation(line: 77, column: 17, scope: !158)
!164 = !DILocation(line: 78, column: 17, scope: !158)
!165 = !DILocation(line: 78, column: 9, scope: !158)
!166 = !DILocation(line: 79, column: 9, scope: !158)
!167 = !DILocation(line: 79, column: 21, scope: !158)
!168 = !DILocation(line: 80, column: 26, scope: !158)
!169 = !DILocation(line: 80, column: 19, scope: !158)
!170 = !DILocation(line: 80, column: 17, scope: !158)
!171 = !DILocation(line: 83, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !158, file: !16, line: 83, column: 9)
!173 = !DILocation(line: 83, column: 14, scope: !172)
!174 = !DILocation(line: 83, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !16, line: 83, column: 9)
!176 = !DILocation(line: 83, column: 25, scope: !175)
!177 = !DILocation(line: 83, column: 23, scope: !175)
!178 = !DILocation(line: 83, column: 9, scope: !172)
!179 = !DILocation(line: 85, column: 23, scope: !180)
!180 = distinct !DILexicalBlock(scope: !175, file: !16, line: 84, column: 9)
!181 = !DILocation(line: 85, column: 28, scope: !180)
!182 = !DILocation(line: 85, column: 18, scope: !180)
!183 = !DILocation(line: 85, column: 13, scope: !180)
!184 = !DILocation(line: 85, column: 21, scope: !180)
!185 = !DILocation(line: 86, column: 9, scope: !180)
!186 = !DILocation(line: 83, column: 35, scope: !175)
!187 = !DILocation(line: 83, column: 9, scope: !175)
!188 = distinct !{!188, !178, !189, !54}
!189 = !DILocation(line: 86, column: 9, scope: !172)
!190 = !DILocation(line: 87, column: 9, scope: !158)
!191 = !DILocation(line: 87, column: 21, scope: !158)
!192 = !DILocation(line: 88, column: 20, scope: !158)
!193 = !DILocation(line: 88, column: 9, scope: !158)
!194 = !DILocation(line: 90, column: 1, scope: !121)
