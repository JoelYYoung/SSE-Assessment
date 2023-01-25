; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* @globalTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx2, align 4, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %2, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !60
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !60
  %5 = load i32*, i32** %data, align 8, !dbg !61
  %6 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !61
  store i32 %4, i32* %arrayidx4, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %7, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !70
  store i32 0, i32* %arrayidx5, align 4, !dbg !71
  %9 = load i32*, i32** %data, align 8, !dbg !72
  call void @printWLine(i32* %9), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #4, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #4, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i32, i32* @globalFalse, align 4, !dbg !106
  %tobool = icmp ne i32 %0, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  %1 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !122
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx2, align 4, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %2, 100, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !135
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !135
  %5 = load i32*, i32** %data, align 8, !dbg !136
  %6 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !136
  store i32 %4, i32* %arrayidx4, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %7, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !144
  store i32 0, i32* %arrayidx5, align 4, !dbg !145
  %9 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %9), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = load i32, i32* @globalTrue, align 4, !dbg !156
  %tobool = icmp ne i32 %0, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !159
  store i32* %arraydecay, i32** %data, align 8, !dbg !161
  %1 = load i32*, i32** %data, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !168, metadata !DIExpression()), !dbg !169
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !170
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !171
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !172
  store i32 0, i32* %arrayidx2, align 4, !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !177
  %cmp = icmp ult i64 %2, 100, !dbg !179
  br i1 %cmp, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !183
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !183
  %5 = load i32*, i32** %data, align 8, !dbg !184
  %6 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !184
  store i32 %4, i32* %arrayidx4, align 4, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %7, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !192
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !192
  store i32 0, i32* %arrayidx5, align 4, !dbg !193
  %9 = load i32*, i32** %data, align 8, !dbg !194
  call void @printWLine(i32* %9), !dbg !195
  ret void, !dbg !196
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 8, scope: !11)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!36 = !DILocation(line: 32, column: 14, scope: !35)
!37 = !DILocation(line: 33, column: 9, scope: !35)
!38 = !DILocation(line: 33, column: 17, scope: !35)
!39 = !DILocation(line: 34, column: 5, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 36, type: !42)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 36, column: 16, scope: !41)
!45 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 37, type: !27)
!46 = !DILocation(line: 37, column: 17, scope: !41)
!47 = !DILocation(line: 38, column: 17, scope: !41)
!48 = !DILocation(line: 38, column: 9, scope: !41)
!49 = !DILocation(line: 39, column: 9, scope: !41)
!50 = !DILocation(line: 39, column: 23, scope: !41)
!51 = !DILocation(line: 41, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !41, file: !12, line: 41, column: 9)
!53 = !DILocation(line: 41, column: 14, scope: !52)
!54 = !DILocation(line: 41, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 41, column: 9)
!56 = !DILocation(line: 41, column: 23, scope: !55)
!57 = !DILocation(line: 41, column: 9, scope: !52)
!58 = !DILocation(line: 43, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 42, column: 9)
!60 = !DILocation(line: 43, column: 23, scope: !59)
!61 = !DILocation(line: 43, column: 13, scope: !59)
!62 = !DILocation(line: 43, column: 18, scope: !59)
!63 = !DILocation(line: 43, column: 21, scope: !59)
!64 = !DILocation(line: 44, column: 9, scope: !59)
!65 = !DILocation(line: 41, column: 31, scope: !55)
!66 = !DILocation(line: 41, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 44, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 45, column: 9, scope: !41)
!71 = !DILocation(line: 45, column: 21, scope: !41)
!72 = !DILocation(line: 46, column: 20, scope: !41)
!73 = !DILocation(line: 46, column: 9, scope: !41)
!74 = !DILocation(line: 48, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_10_good", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 115, column: 5, scope: !75)
!77 = !DILocation(line: 116, column: 5, scope: !75)
!78 = !DILocation(line: 117, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !80, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!19, !19, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 129, type: !19)
!86 = !DILocation(line: 129, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 129, type: !82)
!88 = !DILocation(line: 129, column: 27, scope: !79)
!89 = !DILocation(line: 132, column: 22, scope: !79)
!90 = !DILocation(line: 132, column: 12, scope: !79)
!91 = !DILocation(line: 132, column: 5, scope: !79)
!92 = !DILocation(line: 134, column: 5, scope: !79)
!93 = !DILocation(line: 135, column: 5, scope: !79)
!94 = !DILocation(line: 136, column: 5, scope: !79)
!95 = !DILocation(line: 139, column: 5, scope: !79)
!96 = !DILocation(line: 140, column: 5, scope: !79)
!97 = !DILocation(line: 141, column: 5, scope: !79)
!98 = !DILocation(line: 143, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 57, type: !16)
!101 = !DILocation(line: 57, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 58, type: !22)
!103 = !DILocation(line: 58, column: 13, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 59, type: !27)
!105 = !DILocation(line: 59, column: 13, scope: !99)
!106 = !DILocation(line: 60, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !12, line: 60, column: 8)
!108 = !DILocation(line: 60, column: 8, scope: !99)
!109 = !DILocation(line: 63, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 61, column: 5)
!111 = !DILocation(line: 64, column: 5, scope: !110)
!112 = !DILocation(line: 68, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !12, line: 66, column: 5)
!114 = !DILocation(line: 68, column: 14, scope: !113)
!115 = !DILocation(line: 69, column: 9, scope: !113)
!116 = !DILocation(line: 69, column: 17, scope: !113)
!117 = !DILocalVariable(name: "i", scope: !118, file: !12, line: 72, type: !42)
!118 = distinct !DILexicalBlock(scope: !99, file: !12, line: 71, column: 5)
!119 = !DILocation(line: 72, column: 16, scope: !118)
!120 = !DILocalVariable(name: "source", scope: !118, file: !12, line: 73, type: !27)
!121 = !DILocation(line: 73, column: 17, scope: !118)
!122 = !DILocation(line: 74, column: 17, scope: !118)
!123 = !DILocation(line: 74, column: 9, scope: !118)
!124 = !DILocation(line: 75, column: 9, scope: !118)
!125 = !DILocation(line: 75, column: 23, scope: !118)
!126 = !DILocation(line: 77, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !118, file: !12, line: 77, column: 9)
!128 = !DILocation(line: 77, column: 14, scope: !127)
!129 = !DILocation(line: 77, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 77, column: 9)
!131 = !DILocation(line: 77, column: 23, scope: !130)
!132 = !DILocation(line: 77, column: 9, scope: !127)
!133 = !DILocation(line: 79, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 78, column: 9)
!135 = !DILocation(line: 79, column: 23, scope: !134)
!136 = !DILocation(line: 79, column: 13, scope: !134)
!137 = !DILocation(line: 79, column: 18, scope: !134)
!138 = !DILocation(line: 79, column: 21, scope: !134)
!139 = !DILocation(line: 80, column: 9, scope: !134)
!140 = !DILocation(line: 77, column: 31, scope: !130)
!141 = !DILocation(line: 77, column: 9, scope: !130)
!142 = distinct !{!142, !132, !143, !69}
!143 = !DILocation(line: 80, column: 9, scope: !127)
!144 = !DILocation(line: 81, column: 9, scope: !118)
!145 = !DILocation(line: 81, column: 21, scope: !118)
!146 = !DILocation(line: 82, column: 20, scope: !118)
!147 = !DILocation(line: 82, column: 9, scope: !118)
!148 = !DILocation(line: 84, column: 1, scope: !99)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !12, line: 89, type: !16)
!151 = !DILocation(line: 89, column: 15, scope: !149)
!152 = !DILocalVariable(name: "dataBadBuffer", scope: !149, file: !12, line: 90, type: !22)
!153 = !DILocation(line: 90, column: 13, scope: !149)
!154 = !DILocalVariable(name: "dataGoodBuffer", scope: !149, file: !12, line: 91, type: !27)
!155 = !DILocation(line: 91, column: 13, scope: !149)
!156 = !DILocation(line: 92, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !149, file: !12, line: 92, column: 8)
!158 = !DILocation(line: 92, column: 8, scope: !149)
!159 = !DILocation(line: 95, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 93, column: 5)
!161 = !DILocation(line: 95, column: 14, scope: !160)
!162 = !DILocation(line: 96, column: 9, scope: !160)
!163 = !DILocation(line: 96, column: 17, scope: !160)
!164 = !DILocation(line: 97, column: 5, scope: !160)
!165 = !DILocalVariable(name: "i", scope: !166, file: !12, line: 99, type: !42)
!166 = distinct !DILexicalBlock(scope: !149, file: !12, line: 98, column: 5)
!167 = !DILocation(line: 99, column: 16, scope: !166)
!168 = !DILocalVariable(name: "source", scope: !166, file: !12, line: 100, type: !27)
!169 = !DILocation(line: 100, column: 17, scope: !166)
!170 = !DILocation(line: 101, column: 17, scope: !166)
!171 = !DILocation(line: 101, column: 9, scope: !166)
!172 = !DILocation(line: 102, column: 9, scope: !166)
!173 = !DILocation(line: 102, column: 23, scope: !166)
!174 = !DILocation(line: 104, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !166, file: !12, line: 104, column: 9)
!176 = !DILocation(line: 104, column: 14, scope: !175)
!177 = !DILocation(line: 104, column: 21, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !12, line: 104, column: 9)
!179 = !DILocation(line: 104, column: 23, scope: !178)
!180 = !DILocation(line: 104, column: 9, scope: !175)
!181 = !DILocation(line: 106, column: 30, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !12, line: 105, column: 9)
!183 = !DILocation(line: 106, column: 23, scope: !182)
!184 = !DILocation(line: 106, column: 13, scope: !182)
!185 = !DILocation(line: 106, column: 18, scope: !182)
!186 = !DILocation(line: 106, column: 21, scope: !182)
!187 = !DILocation(line: 107, column: 9, scope: !182)
!188 = !DILocation(line: 104, column: 31, scope: !178)
!189 = !DILocation(line: 104, column: 9, scope: !178)
!190 = distinct !{!190, !180, !191, !69}
!191 = !DILocation(line: 107, column: 9, scope: !175)
!192 = !DILocation(line: 108, column: 9, scope: !166)
!193 = !DILocation(line: 108, column: 21, scope: !166)
!194 = !DILocation(line: 109, column: 20, scope: !166)
!195 = !DILocation(line: 109, column: 9, scope: !166)
!196 = !DILocation(line: 111, column: 1, scope: !149)
