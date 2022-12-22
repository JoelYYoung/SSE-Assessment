; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* @globalFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx2, align 4, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !55
  %cmp3 = icmp ult i64 %2, 100, !dbg !57
  br i1 %cmp3, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !61
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !61
  %5 = load i32*, i32** %data, align 8, !dbg !62
  %6 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !62
  store i32 %4, i32* %arrayidx5, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %7, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !71
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !71
  store i32 0, i32* %arrayidx6, align 4, !dbg !72
  %9 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %9), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_good() #0 !dbg !76 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_bad(), !dbg !97
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32, i32* @globalFive, align 4, !dbg !107
  %cmp = icmp ne i32 %0, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i32* %arraydecay, i32** %data, align 8, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !124
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !125
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx2, align 4, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !131
  %cmp3 = icmp ult i64 %2, 100, !dbg !133
  br i1 %cmp3, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !137
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !137
  %5 = load i32*, i32** %data, align 8, !dbg !138
  %6 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !138
  store i32 %4, i32* %arrayidx5, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %7, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !146
  store i32 0, i32* %arrayidx6, align 4, !dbg !147
  %9 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* %9), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %0 = load i32, i32* @globalFive, align 4, !dbg !158
  %cmp = icmp eq i32 %0, 5, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !162
  store i32* %arraydecay, i32** %data, align 8, !dbg !164
  %1 = load i32*, i32** %data, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !165
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !171, metadata !DIExpression()), !dbg !172
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !173
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !174
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !175
  store i32 0, i32* %arrayidx2, align 4, !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !180
  %cmp3 = icmp ult i64 %2, 100, !dbg !182
  br i1 %cmp3, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !186
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !186
  %5 = load i32*, i32** %data, align 8, !dbg !187
  %6 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !187
  store i32 %4, i32* %arrayidx5, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %7, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !195
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !195
  store i32 0, i32* %arrayidx6, align 4, !dbg !196
  %9 = load i32*, i32** %data, align 8, !dbg !197
  call void @printWLine(i32* %9), !dbg !198
  ret void, !dbg !199
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
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
!33 = !DILocation(line: 28, column: 18, scope: !32)
!34 = !DILocation(line: 28, column: 8, scope: !11)
!35 = !DILocation(line: 32, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!37 = !DILocation(line: 32, column: 14, scope: !36)
!38 = !DILocation(line: 33, column: 9, scope: !36)
!39 = !DILocation(line: 33, column: 17, scope: !36)
!40 = !DILocation(line: 34, column: 5, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 36, column: 16, scope: !42)
!46 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 37, type: !27)
!47 = !DILocation(line: 37, column: 17, scope: !42)
!48 = !DILocation(line: 38, column: 17, scope: !42)
!49 = !DILocation(line: 38, column: 9, scope: !42)
!50 = !DILocation(line: 39, column: 9, scope: !42)
!51 = !DILocation(line: 39, column: 23, scope: !42)
!52 = !DILocation(line: 41, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !42, file: !12, line: 41, column: 9)
!54 = !DILocation(line: 41, column: 14, scope: !53)
!55 = !DILocation(line: 41, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 41, column: 9)
!57 = !DILocation(line: 41, column: 23, scope: !56)
!58 = !DILocation(line: 41, column: 9, scope: !53)
!59 = !DILocation(line: 43, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 42, column: 9)
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
!71 = !DILocation(line: 45, column: 9, scope: !42)
!72 = !DILocation(line: 45, column: 21, scope: !42)
!73 = !DILocation(line: 46, column: 20, scope: !42)
!74 = !DILocation(line: 46, column: 9, scope: !42)
!75 = !DILocation(line: 48, column: 1, scope: !11)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_good", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 115, column: 5, scope: !76)
!78 = !DILocation(line: 116, column: 5, scope: !76)
!79 = !DILocation(line: 117, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !81, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!19, !19, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 129, type: !19)
!87 = !DILocation(line: 129, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 129, type: !83)
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
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 57, type: !16)
!102 = !DILocation(line: 57, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 58, type: !22)
!104 = !DILocation(line: 58, column: 13, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 59, type: !27)
!106 = !DILocation(line: 59, column: 13, scope: !100)
!107 = !DILocation(line: 60, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !12, line: 60, column: 8)
!109 = !DILocation(line: 60, column: 18, scope: !108)
!110 = !DILocation(line: 60, column: 8, scope: !100)
!111 = !DILocation(line: 63, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !12, line: 61, column: 5)
!113 = !DILocation(line: 64, column: 5, scope: !112)
!114 = !DILocation(line: 68, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !12, line: 66, column: 5)
!116 = !DILocation(line: 68, column: 14, scope: !115)
!117 = !DILocation(line: 69, column: 9, scope: !115)
!118 = !DILocation(line: 69, column: 17, scope: !115)
!119 = !DILocalVariable(name: "i", scope: !120, file: !12, line: 72, type: !43)
!120 = distinct !DILexicalBlock(scope: !100, file: !12, line: 71, column: 5)
!121 = !DILocation(line: 72, column: 16, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !120, file: !12, line: 73, type: !27)
!123 = !DILocation(line: 73, column: 17, scope: !120)
!124 = !DILocation(line: 74, column: 17, scope: !120)
!125 = !DILocation(line: 74, column: 9, scope: !120)
!126 = !DILocation(line: 75, column: 9, scope: !120)
!127 = !DILocation(line: 75, column: 23, scope: !120)
!128 = !DILocation(line: 77, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !120, file: !12, line: 77, column: 9)
!130 = !DILocation(line: 77, column: 14, scope: !129)
!131 = !DILocation(line: 77, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 77, column: 9)
!133 = !DILocation(line: 77, column: 23, scope: !132)
!134 = !DILocation(line: 77, column: 9, scope: !129)
!135 = !DILocation(line: 79, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 78, column: 9)
!137 = !DILocation(line: 79, column: 23, scope: !136)
!138 = !DILocation(line: 79, column: 13, scope: !136)
!139 = !DILocation(line: 79, column: 18, scope: !136)
!140 = !DILocation(line: 79, column: 21, scope: !136)
!141 = !DILocation(line: 80, column: 9, scope: !136)
!142 = !DILocation(line: 77, column: 31, scope: !132)
!143 = !DILocation(line: 77, column: 9, scope: !132)
!144 = distinct !{!144, !134, !145, !70}
!145 = !DILocation(line: 80, column: 9, scope: !129)
!146 = !DILocation(line: 81, column: 9, scope: !120)
!147 = !DILocation(line: 81, column: 21, scope: !120)
!148 = !DILocation(line: 82, column: 20, scope: !120)
!149 = !DILocation(line: 82, column: 9, scope: !120)
!150 = !DILocation(line: 84, column: 1, scope: !100)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !12, line: 89, type: !16)
!153 = !DILocation(line: 89, column: 15, scope: !151)
!154 = !DILocalVariable(name: "dataBadBuffer", scope: !151, file: !12, line: 90, type: !22)
!155 = !DILocation(line: 90, column: 13, scope: !151)
!156 = !DILocalVariable(name: "dataGoodBuffer", scope: !151, file: !12, line: 91, type: !27)
!157 = !DILocation(line: 91, column: 13, scope: !151)
!158 = !DILocation(line: 92, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !12, line: 92, column: 8)
!160 = !DILocation(line: 92, column: 18, scope: !159)
!161 = !DILocation(line: 92, column: 8, scope: !151)
!162 = !DILocation(line: 95, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 93, column: 5)
!164 = !DILocation(line: 95, column: 14, scope: !163)
!165 = !DILocation(line: 96, column: 9, scope: !163)
!166 = !DILocation(line: 96, column: 17, scope: !163)
!167 = !DILocation(line: 97, column: 5, scope: !163)
!168 = !DILocalVariable(name: "i", scope: !169, file: !12, line: 99, type: !43)
!169 = distinct !DILexicalBlock(scope: !151, file: !12, line: 98, column: 5)
!170 = !DILocation(line: 99, column: 16, scope: !169)
!171 = !DILocalVariable(name: "source", scope: !169, file: !12, line: 100, type: !27)
!172 = !DILocation(line: 100, column: 17, scope: !169)
!173 = !DILocation(line: 101, column: 17, scope: !169)
!174 = !DILocation(line: 101, column: 9, scope: !169)
!175 = !DILocation(line: 102, column: 9, scope: !169)
!176 = !DILocation(line: 102, column: 23, scope: !169)
!177 = !DILocation(line: 104, column: 16, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !12, line: 104, column: 9)
!179 = !DILocation(line: 104, column: 14, scope: !178)
!180 = !DILocation(line: 104, column: 21, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !12, line: 104, column: 9)
!182 = !DILocation(line: 104, column: 23, scope: !181)
!183 = !DILocation(line: 104, column: 9, scope: !178)
!184 = !DILocation(line: 106, column: 30, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !12, line: 105, column: 9)
!186 = !DILocation(line: 106, column: 23, scope: !185)
!187 = !DILocation(line: 106, column: 13, scope: !185)
!188 = !DILocation(line: 106, column: 18, scope: !185)
!189 = !DILocation(line: 106, column: 21, scope: !185)
!190 = !DILocation(line: 107, column: 9, scope: !185)
!191 = !DILocation(line: 104, column: 31, scope: !181)
!192 = !DILocation(line: 104, column: 9, scope: !181)
!193 = distinct !{!193, !183, !194, !70}
!194 = !DILocation(line: 107, column: 9, scope: !178)
!195 = !DILocation(line: 108, column: 9, scope: !169)
!196 = !DILocation(line: 108, column: 21, scope: !169)
!197 = !DILocation(line: 109, column: 20, scope: !169)
!198 = !DILocation(line: 109, column: 9, scope: !169)
!199 = !DILocation(line: 111, column: 1, scope: !151)
