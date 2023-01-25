; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08_bad() #0 !dbg !15 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx2, align 4, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %6, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !61
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !61
  %9 = load i32*, i32** %data, align 8, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !62
  store i32 %8, i32* %arrayidx4, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %11, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !71
  store i32 0, i32* %arrayidx5, align 4, !dbg !72
  %13 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %13), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08_good() #0 !dbg !76 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !100 {
entry:
  ret i32 1, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 200, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 400, align 16, !dbg !113
  %3 = bitcast i8* %2 to i32*, !dbg !114
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !112
  %call = call i32 @staticReturnsFalse(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !121
  store i32* %4, i32** %data, align 8, !dbg !123
  %5 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !131
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !132
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx2, align 4, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !138
  %cmp = icmp ult i64 %6, 100, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !144
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !144
  %9 = load i32*, i32** %data, align 8, !dbg !145
  %10 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !145
  store i32 %8, i32* %arrayidx4, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %11, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !153
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !153
  store i32 0, i32* %arrayidx5, align 4, !dbg !154
  %13 = load i32*, i32** %data, align 8, !dbg !155
  call void @printWLine(i32* %13), !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !158 {
entry:
  ret i32 0, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !160 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !163, metadata !DIExpression()), !dbg !164
  %0 = alloca i8, i64 200, align 16, !dbg !165
  %1 = bitcast i8* %0 to i32*, !dbg !166
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !164
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !167, metadata !DIExpression()), !dbg !168
  %2 = alloca i8, i64 400, align 16, !dbg !169
  %3 = bitcast i8* %2 to i32*, !dbg !170
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !168
  %call = call i32 @staticReturnsTrue(), !dbg !171
  %tobool = icmp ne i32 %call, 0, !dbg !171
  br i1 %tobool, label %if.then, label %if.end, !dbg !173

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !174
  store i32* %4, i32** %data, align 8, !dbg !176
  %5 = load i32*, i32** %data, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !177
  store i32 0, i32* %arrayidx, align 4, !dbg !178
  br label %if.end, !dbg !179

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !183, metadata !DIExpression()), !dbg !184
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !185
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !186
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !187
  store i32 0, i32* %arrayidx2, align 4, !dbg !188
  store i64 0, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !192
  %cmp = icmp ult i64 %6, 100, !dbg !194
  br i1 %cmp, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !198
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !198
  %9 = load i32*, i32** %data, align 8, !dbg !199
  %10 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !199
  store i32 %8, i32* %arrayidx4, align 4, !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !203
  %inc = add i64 %11, 1, !dbg !203
  store i64 %inc, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !207
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !207
  store i32 0, i32* %arrayidx5, align 4, !dbg !208
  %13 = load i32*, i32** %data, align 8, !dbg !209
  call void @printWLine(i32* %13), !dbg !210
  ret void, !dbg !211
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 42, scope: !15)
!24 = !DILocation(line: 40, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 41, type: !4)
!26 = !DILocation(line: 41, column: 15, scope: !15)
!27 = !DILocation(line: 41, column: 43, scope: !15)
!28 = !DILocation(line: 41, column: 32, scope: !15)
!29 = !DILocation(line: 42, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 8)
!31 = !DILocation(line: 42, column: 8, scope: !15)
!32 = !DILocation(line: 46, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 43, column: 5)
!34 = !DILocation(line: 46, column: 14, scope: !33)
!35 = !DILocation(line: 47, column: 9, scope: !33)
!36 = !DILocation(line: 47, column: 17, scope: !33)
!37 = !DILocation(line: 48, column: 5, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !16, line: 50, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 49, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 50, column: 16, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 51, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 51, column: 17, scope: !39)
!48 = !DILocation(line: 52, column: 17, scope: !39)
!49 = !DILocation(line: 52, column: 9, scope: !39)
!50 = !DILocation(line: 53, column: 9, scope: !39)
!51 = !DILocation(line: 53, column: 23, scope: !39)
!52 = !DILocation(line: 55, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !39, file: !16, line: 55, column: 9)
!54 = !DILocation(line: 55, column: 14, scope: !53)
!55 = !DILocation(line: 55, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !16, line: 55, column: 9)
!57 = !DILocation(line: 55, column: 23, scope: !56)
!58 = !DILocation(line: 55, column: 9, scope: !53)
!59 = !DILocation(line: 57, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !16, line: 56, column: 9)
!61 = !DILocation(line: 57, column: 23, scope: !60)
!62 = !DILocation(line: 57, column: 13, scope: !60)
!63 = !DILocation(line: 57, column: 18, scope: !60)
!64 = !DILocation(line: 57, column: 21, scope: !60)
!65 = !DILocation(line: 58, column: 9, scope: !60)
!66 = !DILocation(line: 55, column: 31, scope: !56)
!67 = !DILocation(line: 55, column: 9, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 58, column: 9, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 59, column: 9, scope: !39)
!72 = !DILocation(line: 59, column: 21, scope: !39)
!73 = !DILocation(line: 60, column: 20, scope: !39)
!74 = !DILocation(line: 60, column: 9, scope: !39)
!75 = !DILocation(line: 62, column: 1, scope: !15)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_08_good", scope: !16, file: !16, line: 127, type: !17, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 129, column: 5, scope: !76)
!78 = !DILocation(line: 130, column: 5, scope: !76)
!79 = !DILocation(line: 131, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 143, type: !81, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !16, line: 143, type: !7)
!87 = !DILocation(line: 143, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !16, line: 143, type: !83)
!89 = !DILocation(line: 143, column: 27, scope: !80)
!90 = !DILocation(line: 146, column: 22, scope: !80)
!91 = !DILocation(line: 146, column: 12, scope: !80)
!92 = !DILocation(line: 146, column: 5, scope: !80)
!93 = !DILocation(line: 148, column: 5, scope: !80)
!94 = !DILocation(line: 149, column: 5, scope: !80)
!95 = !DILocation(line: 150, column: 5, scope: !80)
!96 = !DILocation(line: 153, column: 5, scope: !80)
!97 = !DILocation(line: 154, column: 5, scope: !80)
!98 = !DILocation(line: 155, column: 5, scope: !80)
!99 = !DILocation(line: 157, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !101, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!7}
!103 = !DILocation(line: 27, column: 5, scope: !100)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 69, type: !17, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !16, line: 71, type: !4)
!106 = !DILocation(line: 71, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !16, line: 72, type: !4)
!108 = !DILocation(line: 72, column: 15, scope: !104)
!109 = !DILocation(line: 72, column: 42, scope: !104)
!110 = !DILocation(line: 72, column: 31, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !16, line: 73, type: !4)
!112 = !DILocation(line: 73, column: 15, scope: !104)
!113 = !DILocation(line: 73, column: 43, scope: !104)
!114 = !DILocation(line: 73, column: 32, scope: !104)
!115 = !DILocation(line: 74, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !16, line: 74, column: 8)
!117 = !DILocation(line: 74, column: 8, scope: !104)
!118 = !DILocation(line: 77, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !16, line: 75, column: 5)
!120 = !DILocation(line: 78, column: 5, scope: !119)
!121 = !DILocation(line: 82, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !16, line: 80, column: 5)
!123 = !DILocation(line: 82, column: 14, scope: !122)
!124 = !DILocation(line: 83, column: 9, scope: !122)
!125 = !DILocation(line: 83, column: 17, scope: !122)
!126 = !DILocalVariable(name: "i", scope: !127, file: !16, line: 86, type: !40)
!127 = distinct !DILexicalBlock(scope: !104, file: !16, line: 85, column: 5)
!128 = !DILocation(line: 86, column: 16, scope: !127)
!129 = !DILocalVariable(name: "source", scope: !127, file: !16, line: 87, type: !44)
!130 = !DILocation(line: 87, column: 17, scope: !127)
!131 = !DILocation(line: 88, column: 17, scope: !127)
!132 = !DILocation(line: 88, column: 9, scope: !127)
!133 = !DILocation(line: 89, column: 9, scope: !127)
!134 = !DILocation(line: 89, column: 23, scope: !127)
!135 = !DILocation(line: 91, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !127, file: !16, line: 91, column: 9)
!137 = !DILocation(line: 91, column: 14, scope: !136)
!138 = !DILocation(line: 91, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !16, line: 91, column: 9)
!140 = !DILocation(line: 91, column: 23, scope: !139)
!141 = !DILocation(line: 91, column: 9, scope: !136)
!142 = !DILocation(line: 93, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !16, line: 92, column: 9)
!144 = !DILocation(line: 93, column: 23, scope: !143)
!145 = !DILocation(line: 93, column: 13, scope: !143)
!146 = !DILocation(line: 93, column: 18, scope: !143)
!147 = !DILocation(line: 93, column: 21, scope: !143)
!148 = !DILocation(line: 94, column: 9, scope: !143)
!149 = !DILocation(line: 91, column: 31, scope: !139)
!150 = !DILocation(line: 91, column: 9, scope: !139)
!151 = distinct !{!151, !141, !152, !70}
!152 = !DILocation(line: 94, column: 9, scope: !136)
!153 = !DILocation(line: 95, column: 9, scope: !127)
!154 = !DILocation(line: 95, column: 21, scope: !127)
!155 = !DILocation(line: 96, column: 20, scope: !127)
!156 = !DILocation(line: 96, column: 9, scope: !127)
!157 = !DILocation(line: 98, column: 1, scope: !104)
!158 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !101, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!159 = !DILocation(line: 32, column: 5, scope: !158)
!160 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DILocalVariable(name: "data", scope: !160, file: !16, line: 103, type: !4)
!162 = !DILocation(line: 103, column: 15, scope: !160)
!163 = !DILocalVariable(name: "dataBadBuffer", scope: !160, file: !16, line: 104, type: !4)
!164 = !DILocation(line: 104, column: 15, scope: !160)
!165 = !DILocation(line: 104, column: 42, scope: !160)
!166 = !DILocation(line: 104, column: 31, scope: !160)
!167 = !DILocalVariable(name: "dataGoodBuffer", scope: !160, file: !16, line: 105, type: !4)
!168 = !DILocation(line: 105, column: 15, scope: !160)
!169 = !DILocation(line: 105, column: 43, scope: !160)
!170 = !DILocation(line: 105, column: 32, scope: !160)
!171 = !DILocation(line: 106, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !160, file: !16, line: 106, column: 8)
!173 = !DILocation(line: 106, column: 8, scope: !160)
!174 = !DILocation(line: 109, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !16, line: 107, column: 5)
!176 = !DILocation(line: 109, column: 14, scope: !175)
!177 = !DILocation(line: 110, column: 9, scope: !175)
!178 = !DILocation(line: 110, column: 17, scope: !175)
!179 = !DILocation(line: 111, column: 5, scope: !175)
!180 = !DILocalVariable(name: "i", scope: !181, file: !16, line: 113, type: !40)
!181 = distinct !DILexicalBlock(scope: !160, file: !16, line: 112, column: 5)
!182 = !DILocation(line: 113, column: 16, scope: !181)
!183 = !DILocalVariable(name: "source", scope: !181, file: !16, line: 114, type: !44)
!184 = !DILocation(line: 114, column: 17, scope: !181)
!185 = !DILocation(line: 115, column: 17, scope: !181)
!186 = !DILocation(line: 115, column: 9, scope: !181)
!187 = !DILocation(line: 116, column: 9, scope: !181)
!188 = !DILocation(line: 116, column: 23, scope: !181)
!189 = !DILocation(line: 118, column: 16, scope: !190)
!190 = distinct !DILexicalBlock(scope: !181, file: !16, line: 118, column: 9)
!191 = !DILocation(line: 118, column: 14, scope: !190)
!192 = !DILocation(line: 118, column: 21, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !16, line: 118, column: 9)
!194 = !DILocation(line: 118, column: 23, scope: !193)
!195 = !DILocation(line: 118, column: 9, scope: !190)
!196 = !DILocation(line: 120, column: 30, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !16, line: 119, column: 9)
!198 = !DILocation(line: 120, column: 23, scope: !197)
!199 = !DILocation(line: 120, column: 13, scope: !197)
!200 = !DILocation(line: 120, column: 18, scope: !197)
!201 = !DILocation(line: 120, column: 21, scope: !197)
!202 = !DILocation(line: 121, column: 9, scope: !197)
!203 = !DILocation(line: 118, column: 31, scope: !193)
!204 = !DILocation(line: 118, column: 9, scope: !193)
!205 = distinct !{!205, !195, !206, !70}
!206 = !DILocation(line: 121, column: 9, scope: !190)
!207 = !DILocation(line: 122, column: 9, scope: !181)
!208 = !DILocation(line: 122, column: 21, scope: !181)
!209 = !DILocation(line: 123, column: 20, scope: !181)
!210 = !DILocation(line: 123, column: 9, scope: !181)
!211 = !DILocation(line: 125, column: 1, scope: !160)
