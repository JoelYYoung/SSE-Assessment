; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32, i32* @globalTrue, align 4, !dbg !29
  %tobool = icmp ne i32 %4, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %5, i32** %data, align 8, !dbg !34
  %6 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx1, align 4, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %7, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !61
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !61
  %10 = load i32*, i32** %data, align 8, !dbg !62
  %11 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !62
  store i32 %9, i32* %arrayidx3, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %12, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !71
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !71
  store i32 0, i32* %arrayidx4, align 4, !dbg !72
  %14 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %14), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #4, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #4, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 200, align 16, !dbg !105
  %1 = bitcast i8* %0 to i32*, !dbg !106
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = alloca i8, i64 400, align 16, !dbg !109
  %3 = bitcast i8* %2 to i32*, !dbg !110
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !108
  %4 = load i32, i32* @globalFalse, align 4, !dbg !111
  %tobool = icmp ne i32 %4, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !117
  store i32* %5, i32** %data, align 8, !dbg !119
  %6 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !128
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx1, align 4, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !134
  %cmp = icmp ult i64 %7, 100, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !140
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !140
  %10 = load i32*, i32** %data, align 8, !dbg !141
  %11 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !141
  store i32 %9, i32* %arrayidx3, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %12, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !149
  store i32 0, i32* %arrayidx4, align 4, !dbg !150
  %14 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* %14), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  %0 = alloca i8, i64 200, align 16, !dbg !159
  %1 = bitcast i8* %0 to i32*, !dbg !160
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %2 = alloca i8, i64 400, align 16, !dbg !163
  %3 = bitcast i8* %2 to i32*, !dbg !164
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !162
  %4 = load i32, i32* @globalTrue, align 4, !dbg !165
  %tobool = icmp ne i32 %4, 0, !dbg !165
  br i1 %tobool, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !168
  store i32* %5, i32** %data, align 8, !dbg !170
  %6 = load i32*, i32** %data, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !171
  store i32 0, i32* %arrayidx, align 4, !dbg !172
  br label %if.end, !dbg !173

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !174, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !177, metadata !DIExpression()), !dbg !178
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !179
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !180
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !181
  store i32 0, i32* %arrayidx1, align 4, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !186
  %cmp = icmp ult i64 %7, 100, !dbg !188
  br i1 %cmp, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !192
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !192
  %10 = load i32*, i32** %data, align 8, !dbg !193
  %11 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !193
  store i32 %9, i32* %arrayidx3, align 4, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %12, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !201
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !201
  store i32 0, i32* %arrayidx4, align 4, !dbg !202
  %14 = load i32*, i32** %data, align 8, !dbg !203
  call void @printWLine(i32* %14), !dbg !204
  ret void, !dbg !205
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 8, scope: !15)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 14, scope: !33)
!35 = !DILocation(line: 33, column: 9, scope: !33)
!36 = !DILocation(line: 33, column: 17, scope: !33)
!37 = !DILocation(line: 34, column: 5, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !16, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 36, column: 16, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 37, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 37, column: 17, scope: !39)
!48 = !DILocation(line: 38, column: 17, scope: !39)
!49 = !DILocation(line: 38, column: 9, scope: !39)
!50 = !DILocation(line: 39, column: 9, scope: !39)
!51 = !DILocation(line: 39, column: 23, scope: !39)
!52 = !DILocation(line: 41, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !39, file: !16, line: 41, column: 9)
!54 = !DILocation(line: 41, column: 14, scope: !53)
!55 = !DILocation(line: 41, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !16, line: 41, column: 9)
!57 = !DILocation(line: 41, column: 23, scope: !56)
!58 = !DILocation(line: 41, column: 9, scope: !53)
!59 = !DILocation(line: 43, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !16, line: 42, column: 9)
!61 = !DILocation(line: 43, column: 23, scope: !60)
!62 = !DILocation(line: 43, column: 13, scope: !60)
!63 = !DILocation(line: 43, column: 18, scope: !60)
!64 = !DILocation(line: 43, column: 21, scope: !60)
!65 = !DILocation(line: 44, column: 9, scope: !60)
!66 = !DILocation(line: 41, column: 31, scope: !56)
!67 = !DILocation(line: 41, column: 9, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 44, column: 9, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 45, column: 9, scope: !39)
!72 = !DILocation(line: 45, column: 21, scope: !39)
!73 = !DILocation(line: 46, column: 20, scope: !39)
!74 = !DILocation(line: 46, column: 9, scope: !39)
!75 = !DILocation(line: 48, column: 1, scope: !15)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_10_good", scope: !16, file: !16, line: 113, type: !17, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 115, column: 5, scope: !76)
!78 = !DILocation(line: 116, column: 5, scope: !76)
!79 = !DILocation(line: 117, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 129, type: !81, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !16, line: 129, type: !7)
!87 = !DILocation(line: 129, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !16, line: 129, type: !83)
!89 = !DILocation(line: 129, column: 27, scope: !80)
!90 = !DILocation(line: 132, column: 22, scope: !80)
!91 = !DILocation(line: 132, column: 12, scope: !80)
!92 = !DILocation(line: 132, column: 5, scope: !80)
!93 = !DILocation(line: 134, column: 5, scope: !80)
!94 = !DILocation(line: 135, column: 5, scope: !80)
!95 = !DILocation(line: 136, column: 5, scope: !80)
!96 = !DILocation(line: 139, column: 5, scope: !80)
!97 = !DILocation(line: 140, column: 5, scope: !80)
!98 = !DILocation(line: 141, column: 5, scope: !80)
!99 = !DILocation(line: 143, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !16, line: 57, type: !4)
!102 = !DILocation(line: 57, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !16, line: 58, type: !4)
!104 = !DILocation(line: 58, column: 15, scope: !100)
!105 = !DILocation(line: 58, column: 42, scope: !100)
!106 = !DILocation(line: 58, column: 31, scope: !100)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !16, line: 59, type: !4)
!108 = !DILocation(line: 59, column: 15, scope: !100)
!109 = !DILocation(line: 59, column: 43, scope: !100)
!110 = !DILocation(line: 59, column: 32, scope: !100)
!111 = !DILocation(line: 60, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !100, file: !16, line: 60, column: 8)
!113 = !DILocation(line: 60, column: 8, scope: !100)
!114 = !DILocation(line: 63, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !16, line: 61, column: 5)
!116 = !DILocation(line: 64, column: 5, scope: !115)
!117 = !DILocation(line: 68, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !16, line: 66, column: 5)
!119 = !DILocation(line: 68, column: 14, scope: !118)
!120 = !DILocation(line: 69, column: 9, scope: !118)
!121 = !DILocation(line: 69, column: 17, scope: !118)
!122 = !DILocalVariable(name: "i", scope: !123, file: !16, line: 72, type: !40)
!123 = distinct !DILexicalBlock(scope: !100, file: !16, line: 71, column: 5)
!124 = !DILocation(line: 72, column: 16, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !123, file: !16, line: 73, type: !44)
!126 = !DILocation(line: 73, column: 17, scope: !123)
!127 = !DILocation(line: 74, column: 17, scope: !123)
!128 = !DILocation(line: 74, column: 9, scope: !123)
!129 = !DILocation(line: 75, column: 9, scope: !123)
!130 = !DILocation(line: 75, column: 23, scope: !123)
!131 = !DILocation(line: 77, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !16, line: 77, column: 9)
!133 = !DILocation(line: 77, column: 14, scope: !132)
!134 = !DILocation(line: 77, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !16, line: 77, column: 9)
!136 = !DILocation(line: 77, column: 23, scope: !135)
!137 = !DILocation(line: 77, column: 9, scope: !132)
!138 = !DILocation(line: 79, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !16, line: 78, column: 9)
!140 = !DILocation(line: 79, column: 23, scope: !139)
!141 = !DILocation(line: 79, column: 13, scope: !139)
!142 = !DILocation(line: 79, column: 18, scope: !139)
!143 = !DILocation(line: 79, column: 21, scope: !139)
!144 = !DILocation(line: 80, column: 9, scope: !139)
!145 = !DILocation(line: 77, column: 31, scope: !135)
!146 = !DILocation(line: 77, column: 9, scope: !135)
!147 = distinct !{!147, !137, !148, !70}
!148 = !DILocation(line: 80, column: 9, scope: !132)
!149 = !DILocation(line: 81, column: 9, scope: !123)
!150 = !DILocation(line: 81, column: 21, scope: !123)
!151 = !DILocation(line: 82, column: 20, scope: !123)
!152 = !DILocation(line: 82, column: 9, scope: !123)
!153 = !DILocation(line: 84, column: 1, scope: !100)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocalVariable(name: "data", scope: !154, file: !16, line: 89, type: !4)
!156 = !DILocation(line: 89, column: 15, scope: !154)
!157 = !DILocalVariable(name: "dataBadBuffer", scope: !154, file: !16, line: 90, type: !4)
!158 = !DILocation(line: 90, column: 15, scope: !154)
!159 = !DILocation(line: 90, column: 42, scope: !154)
!160 = !DILocation(line: 90, column: 31, scope: !154)
!161 = !DILocalVariable(name: "dataGoodBuffer", scope: !154, file: !16, line: 91, type: !4)
!162 = !DILocation(line: 91, column: 15, scope: !154)
!163 = !DILocation(line: 91, column: 43, scope: !154)
!164 = !DILocation(line: 91, column: 32, scope: !154)
!165 = !DILocation(line: 92, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !154, file: !16, line: 92, column: 8)
!167 = !DILocation(line: 92, column: 8, scope: !154)
!168 = !DILocation(line: 95, column: 16, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !16, line: 93, column: 5)
!170 = !DILocation(line: 95, column: 14, scope: !169)
!171 = !DILocation(line: 96, column: 9, scope: !169)
!172 = !DILocation(line: 96, column: 17, scope: !169)
!173 = !DILocation(line: 97, column: 5, scope: !169)
!174 = !DILocalVariable(name: "i", scope: !175, file: !16, line: 99, type: !40)
!175 = distinct !DILexicalBlock(scope: !154, file: !16, line: 98, column: 5)
!176 = !DILocation(line: 99, column: 16, scope: !175)
!177 = !DILocalVariable(name: "source", scope: !175, file: !16, line: 100, type: !44)
!178 = !DILocation(line: 100, column: 17, scope: !175)
!179 = !DILocation(line: 101, column: 17, scope: !175)
!180 = !DILocation(line: 101, column: 9, scope: !175)
!181 = !DILocation(line: 102, column: 9, scope: !175)
!182 = !DILocation(line: 102, column: 23, scope: !175)
!183 = !DILocation(line: 104, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !175, file: !16, line: 104, column: 9)
!185 = !DILocation(line: 104, column: 14, scope: !184)
!186 = !DILocation(line: 104, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !16, line: 104, column: 9)
!188 = !DILocation(line: 104, column: 23, scope: !187)
!189 = !DILocation(line: 104, column: 9, scope: !184)
!190 = !DILocation(line: 106, column: 30, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !16, line: 105, column: 9)
!192 = !DILocation(line: 106, column: 23, scope: !191)
!193 = !DILocation(line: 106, column: 13, scope: !191)
!194 = !DILocation(line: 106, column: 18, scope: !191)
!195 = !DILocation(line: 106, column: 21, scope: !191)
!196 = !DILocation(line: 107, column: 9, scope: !191)
!197 = !DILocation(line: 104, column: 31, scope: !187)
!198 = !DILocation(line: 104, column: 9, scope: !187)
!199 = distinct !{!199, !189, !200, !70}
!200 = !DILocation(line: 107, column: 9, scope: !184)
!201 = !DILocation(line: 108, column: 9, scope: !175)
!202 = !DILocation(line: 108, column: 21, scope: !175)
!203 = !DILocation(line: 109, column: 20, scope: !175)
!204 = !DILocation(line: 109, column: 9, scope: !175)
!205 = !DILocation(line: 111, column: 1, scope: !154)
