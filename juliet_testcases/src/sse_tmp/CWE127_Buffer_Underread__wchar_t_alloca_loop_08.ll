; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_08_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %call1 = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call1, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !34
  store i32* %add.ptr, i32** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %5, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !58
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !58
  %9 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !62
  store i32 %8, i32* %arrayidx5, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %10, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !70
  store i32 0, i32* %arrayidx6, align 4, !dbg !71
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  call void @printWLine(i32* %arraydecay7), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_08_good() #0 !dbg !75 {
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
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_08_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_08_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !99 {
entry:
  ret i32 1, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 400, align 16, !dbg !108
  %1 = bitcast i8* %0 to i32*, !dbg !109
  store i32* %1, i32** %dataBuffer, align 8, !dbg !107
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !111
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %call1 = call i32 @staticReturnsFalse(), !dbg !114
  %tobool = icmp ne i32 %call1, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !120
  store i32* %4, i32** %data, align 8, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !129
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx3, align 4, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !135
  %cmp = icmp ult i64 %5, 100, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !139
  %7 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !139
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !139
  %9 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !143
  store i32 %8, i32* %arrayidx5, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %10, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx6, align 4, !dbg !151
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  call void @printWLine(i32* %arraydecay7), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !155 {
entry:
  ret i32 0, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = alloca i8, i64 400, align 16, !dbg !162
  %1 = bitcast i8* %0 to i32*, !dbg !163
  store i32* %1, i32** %dataBuffer, align 8, !dbg !161
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !164
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !165
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !166
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !166
  store i32 0, i32* %arrayidx, align 4, !dbg !167
  %call1 = call i32 @staticReturnsTrue(), !dbg !168
  %tobool = icmp ne i32 %call1, 0, !dbg !168
  br i1 %tobool, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !171
  store i32* %4, i32** %data, align 8, !dbg !173
  br label %if.end, !dbg !174

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !175, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !180
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !181
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !182
  store i32 0, i32* %arrayidx3, align 4, !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !187
  %cmp = icmp ult i64 %5, 100, !dbg !189
  br i1 %cmp, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !191
  %7 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !191
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !191
  %9 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !195
  store i32 %8, i32* %arrayidx5, align 4, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %10, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !202
  store i32 0, i32* %arrayidx6, align 4, !dbg !203
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !204
  call void @printWLine(i32* %arraydecay7), !dbg !205
  ret void, !dbg !206
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 39, scope: !15)
!24 = !DILocation(line: 40, column: 28, scope: !15)
!25 = !DILocation(line: 41, column: 13, scope: !15)
!26 = !DILocation(line: 41, column: 5, scope: !15)
!27 = !DILocation(line: 42, column: 5, scope: !15)
!28 = !DILocation(line: 42, column: 23, scope: !15)
!29 = !DILocation(line: 43, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 43, column: 8)
!31 = !DILocation(line: 43, column: 8, scope: !15)
!32 = !DILocation(line: 46, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 44, column: 5)
!34 = !DILocation(line: 46, column: 27, scope: !33)
!35 = !DILocation(line: 46, column: 14, scope: !33)
!36 = !DILocation(line: 47, column: 5, scope: !33)
!37 = !DILocalVariable(name: "i", scope: !38, file: !16, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 48, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 49, column: 16, scope: !38)
!42 = !DILocalVariable(name: "dest", scope: !38, file: !16, line: 50, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 50, column: 17, scope: !38)
!47 = !DILocation(line: 51, column: 17, scope: !38)
!48 = !DILocation(line: 51, column: 9, scope: !38)
!49 = !DILocation(line: 52, column: 9, scope: !38)
!50 = !DILocation(line: 52, column: 21, scope: !38)
!51 = !DILocation(line: 54, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !38, file: !16, line: 54, column: 9)
!53 = !DILocation(line: 54, column: 14, scope: !52)
!54 = !DILocation(line: 54, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !16, line: 54, column: 9)
!56 = !DILocation(line: 54, column: 23, scope: !55)
!57 = !DILocation(line: 54, column: 9, scope: !52)
!58 = !DILocation(line: 56, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !16, line: 55, column: 9)
!60 = !DILocation(line: 56, column: 28, scope: !59)
!61 = !DILocation(line: 56, column: 18, scope: !59)
!62 = !DILocation(line: 56, column: 13, scope: !59)
!63 = !DILocation(line: 56, column: 21, scope: !59)
!64 = !DILocation(line: 57, column: 9, scope: !59)
!65 = !DILocation(line: 54, column: 31, scope: !55)
!66 = !DILocation(line: 54, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 57, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 59, column: 9, scope: !38)
!71 = !DILocation(line: 59, column: 21, scope: !38)
!72 = !DILocation(line: 60, column: 20, scope: !38)
!73 = !DILocation(line: 60, column: 9, scope: !38)
!74 = !DILocation(line: 62, column: 1, scope: !15)
!75 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_08_good", scope: !16, file: !16, line: 129, type: !17, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 131, column: 5, scope: !75)
!77 = !DILocation(line: 132, column: 5, scope: !75)
!78 = !DILocation(line: 133, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 145, type: !80, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!7, !7, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !16, line: 145, type: !7)
!86 = !DILocation(line: 145, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !16, line: 145, type: !82)
!88 = !DILocation(line: 145, column: 27, scope: !79)
!89 = !DILocation(line: 148, column: 22, scope: !79)
!90 = !DILocation(line: 148, column: 12, scope: !79)
!91 = !DILocation(line: 148, column: 5, scope: !79)
!92 = !DILocation(line: 150, column: 5, scope: !79)
!93 = !DILocation(line: 151, column: 5, scope: !79)
!94 = !DILocation(line: 152, column: 5, scope: !79)
!95 = !DILocation(line: 155, column: 5, scope: !79)
!96 = !DILocation(line: 156, column: 5, scope: !79)
!97 = !DILocation(line: 157, column: 5, scope: !79)
!98 = !DILocation(line: 159, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !100, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!7}
!102 = !DILocation(line: 27, column: 5, scope: !99)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 69, type: !17, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !16, line: 71, type: !4)
!105 = !DILocation(line: 71, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !16, line: 72, type: !4)
!107 = !DILocation(line: 72, column: 15, scope: !103)
!108 = !DILocation(line: 72, column: 39, scope: !103)
!109 = !DILocation(line: 72, column: 28, scope: !103)
!110 = !DILocation(line: 73, column: 13, scope: !103)
!111 = !DILocation(line: 73, column: 5, scope: !103)
!112 = !DILocation(line: 74, column: 5, scope: !103)
!113 = !DILocation(line: 74, column: 23, scope: !103)
!114 = !DILocation(line: 75, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !103, file: !16, line: 75, column: 8)
!116 = !DILocation(line: 75, column: 8, scope: !103)
!117 = !DILocation(line: 78, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !16, line: 76, column: 5)
!119 = !DILocation(line: 79, column: 5, scope: !118)
!120 = !DILocation(line: 83, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !16, line: 81, column: 5)
!122 = !DILocation(line: 83, column: 14, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !16, line: 86, type: !39)
!124 = distinct !DILexicalBlock(scope: !103, file: !16, line: 85, column: 5)
!125 = !DILocation(line: 86, column: 16, scope: !124)
!126 = !DILocalVariable(name: "dest", scope: !124, file: !16, line: 87, type: !43)
!127 = !DILocation(line: 87, column: 17, scope: !124)
!128 = !DILocation(line: 88, column: 17, scope: !124)
!129 = !DILocation(line: 88, column: 9, scope: !124)
!130 = !DILocation(line: 89, column: 9, scope: !124)
!131 = !DILocation(line: 89, column: 21, scope: !124)
!132 = !DILocation(line: 91, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !124, file: !16, line: 91, column: 9)
!134 = !DILocation(line: 91, column: 14, scope: !133)
!135 = !DILocation(line: 91, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !16, line: 91, column: 9)
!137 = !DILocation(line: 91, column: 23, scope: !136)
!138 = !DILocation(line: 91, column: 9, scope: !133)
!139 = !DILocation(line: 93, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !16, line: 92, column: 9)
!141 = !DILocation(line: 93, column: 28, scope: !140)
!142 = !DILocation(line: 93, column: 18, scope: !140)
!143 = !DILocation(line: 93, column: 13, scope: !140)
!144 = !DILocation(line: 93, column: 21, scope: !140)
!145 = !DILocation(line: 94, column: 9, scope: !140)
!146 = !DILocation(line: 91, column: 31, scope: !136)
!147 = !DILocation(line: 91, column: 9, scope: !136)
!148 = distinct !{!148, !138, !149, !69}
!149 = !DILocation(line: 94, column: 9, scope: !133)
!150 = !DILocation(line: 96, column: 9, scope: !124)
!151 = !DILocation(line: 96, column: 21, scope: !124)
!152 = !DILocation(line: 97, column: 20, scope: !124)
!153 = !DILocation(line: 97, column: 9, scope: !124)
!154 = !DILocation(line: 99, column: 1, scope: !103)
!155 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !100, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocation(line: 32, column: 5, scope: !155)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 102, type: !17, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", scope: !157, file: !16, line: 104, type: !4)
!159 = !DILocation(line: 104, column: 15, scope: !157)
!160 = !DILocalVariable(name: "dataBuffer", scope: !157, file: !16, line: 105, type: !4)
!161 = !DILocation(line: 105, column: 15, scope: !157)
!162 = !DILocation(line: 105, column: 39, scope: !157)
!163 = !DILocation(line: 105, column: 28, scope: !157)
!164 = !DILocation(line: 106, column: 13, scope: !157)
!165 = !DILocation(line: 106, column: 5, scope: !157)
!166 = !DILocation(line: 107, column: 5, scope: !157)
!167 = !DILocation(line: 107, column: 23, scope: !157)
!168 = !DILocation(line: 108, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !157, file: !16, line: 108, column: 8)
!170 = !DILocation(line: 108, column: 8, scope: !157)
!171 = !DILocation(line: 111, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !16, line: 109, column: 5)
!173 = !DILocation(line: 111, column: 14, scope: !172)
!174 = !DILocation(line: 112, column: 5, scope: !172)
!175 = !DILocalVariable(name: "i", scope: !176, file: !16, line: 114, type: !39)
!176 = distinct !DILexicalBlock(scope: !157, file: !16, line: 113, column: 5)
!177 = !DILocation(line: 114, column: 16, scope: !176)
!178 = !DILocalVariable(name: "dest", scope: !176, file: !16, line: 115, type: !43)
!179 = !DILocation(line: 115, column: 17, scope: !176)
!180 = !DILocation(line: 116, column: 17, scope: !176)
!181 = !DILocation(line: 116, column: 9, scope: !176)
!182 = !DILocation(line: 117, column: 9, scope: !176)
!183 = !DILocation(line: 117, column: 21, scope: !176)
!184 = !DILocation(line: 119, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !176, file: !16, line: 119, column: 9)
!186 = !DILocation(line: 119, column: 14, scope: !185)
!187 = !DILocation(line: 119, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !16, line: 119, column: 9)
!189 = !DILocation(line: 119, column: 23, scope: !188)
!190 = !DILocation(line: 119, column: 9, scope: !185)
!191 = !DILocation(line: 121, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !16, line: 120, column: 9)
!193 = !DILocation(line: 121, column: 28, scope: !192)
!194 = !DILocation(line: 121, column: 18, scope: !192)
!195 = !DILocation(line: 121, column: 13, scope: !192)
!196 = !DILocation(line: 121, column: 21, scope: !192)
!197 = !DILocation(line: 122, column: 9, scope: !192)
!198 = !DILocation(line: 119, column: 31, scope: !188)
!199 = !DILocation(line: 119, column: 9, scope: !188)
!200 = distinct !{!200, !190, !201, !69}
!201 = !DILocation(line: 122, column: 9, scope: !185)
!202 = !DILocation(line: 124, column: 9, scope: !176)
!203 = !DILocation(line: 124, column: 21, scope: !176)
!204 = !DILocation(line: 125, column: 20, scope: !176)
!205 = !DILocation(line: 125, column: 9, scope: !176)
!206 = !DILocation(line: 127, column: 1, scope: !157)
