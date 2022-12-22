; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %call = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %1, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !60
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !60
  %4 = load i32*, i32** %data, align 8, !dbg !61
  %5 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !61
  store i32 %3, i32* %arrayidx5, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %6, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !70
  store i32 0, i32* %arrayidx6, align 4, !dbg !71
  %8 = load i32*, i32** %data, align 8, !dbg !72
  call void @printWLine(i32* %8), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08_good() #0 !dbg !75 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08_bad(), !dbg !96
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i32 @staticReturnsFalse(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store i32* %arraydecay, i32** %data, align 8, !dbg !118
  %0 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !126
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !127
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx3, align 4, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %1, 100, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !139
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !139
  %4 = load i32*, i32** %data, align 8, !dbg !140
  %5 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !140
  store i32 %3, i32* %arrayidx5, align 4, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %6, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !148
  store i32 0, i32* %arrayidx6, align 4, !dbg !149
  %8 = load i32*, i32** %data, align 8, !dbg !150
  call void @printWLine(i32* %8), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !153 {
entry:
  ret i32 0, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  %call = call i32 @staticReturnsTrue(), !dbg !162
  %tobool = icmp ne i32 %call, 0, !dbg !162
  br i1 %tobool, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !165
  store i32* %arraydecay, i32** %data, align 8, !dbg !167
  %0 = load i32*, i32** %data, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !168
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  br label %if.end, !dbg !170

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !174, metadata !DIExpression()), !dbg !175
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !176
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !177
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !178
  store i32 0, i32* %arrayidx3, align 4, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !183
  %cmp = icmp ult i64 %1, 100, !dbg !185
  br i1 %cmp, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !189
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !189
  %4 = load i32*, i32** %data, align 8, !dbg !190
  %5 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !190
  store i32 %3, i32* %arrayidx5, align 4, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !194
  %inc = add i64 %6, 1, !dbg !194
  store i64 %inc, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !198
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !198
  store i32 0, i32* %arrayidx6, align 4, !dbg !199
  %8 = load i32*, i32** %data, align 8, !dbg !200
  call void @printWLine(i32* %8), !dbg !201
  ret void, !dbg !202
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 42, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!33 = !DILocation(line: 42, column: 8, scope: !11)
!34 = !DILocation(line: 46, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 43, column: 5)
!36 = !DILocation(line: 46, column: 14, scope: !35)
!37 = !DILocation(line: 47, column: 9, scope: !35)
!38 = !DILocation(line: 47, column: 17, scope: !35)
!39 = !DILocation(line: 48, column: 5, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 50, type: !42)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 49, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 50, column: 16, scope: !41)
!45 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 51, type: !27)
!46 = !DILocation(line: 51, column: 17, scope: !41)
!47 = !DILocation(line: 52, column: 17, scope: !41)
!48 = !DILocation(line: 52, column: 9, scope: !41)
!49 = !DILocation(line: 53, column: 9, scope: !41)
!50 = !DILocation(line: 53, column: 23, scope: !41)
!51 = !DILocation(line: 55, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !41, file: !12, line: 55, column: 9)
!53 = !DILocation(line: 55, column: 14, scope: !52)
!54 = !DILocation(line: 55, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 55, column: 9)
!56 = !DILocation(line: 55, column: 23, scope: !55)
!57 = !DILocation(line: 55, column: 9, scope: !52)
!58 = !DILocation(line: 57, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 56, column: 9)
!60 = !DILocation(line: 57, column: 23, scope: !59)
!61 = !DILocation(line: 57, column: 13, scope: !59)
!62 = !DILocation(line: 57, column: 18, scope: !59)
!63 = !DILocation(line: 57, column: 21, scope: !59)
!64 = !DILocation(line: 58, column: 9, scope: !59)
!65 = !DILocation(line: 55, column: 31, scope: !55)
!66 = !DILocation(line: 55, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 58, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 59, column: 9, scope: !41)
!71 = !DILocation(line: 59, column: 21, scope: !41)
!72 = !DILocation(line: 60, column: 20, scope: !41)
!73 = !DILocation(line: 60, column: 9, scope: !41)
!74 = !DILocation(line: 62, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_08_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 129, column: 5, scope: !75)
!77 = !DILocation(line: 130, column: 5, scope: !75)
!78 = !DILocation(line: 131, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !80, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!19, !19, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 143, type: !19)
!86 = !DILocation(line: 143, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 143, type: !82)
!88 = !DILocation(line: 143, column: 27, scope: !79)
!89 = !DILocation(line: 146, column: 22, scope: !79)
!90 = !DILocation(line: 146, column: 12, scope: !79)
!91 = !DILocation(line: 146, column: 5, scope: !79)
!92 = !DILocation(line: 148, column: 5, scope: !79)
!93 = !DILocation(line: 149, column: 5, scope: !79)
!94 = !DILocation(line: 150, column: 5, scope: !79)
!95 = !DILocation(line: 153, column: 5, scope: !79)
!96 = !DILocation(line: 154, column: 5, scope: !79)
!97 = !DILocation(line: 155, column: 5, scope: !79)
!98 = !DILocation(line: 157, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !100, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!19}
!102 = !DILocation(line: 27, column: 5, scope: !99)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 71, type: !16)
!105 = !DILocation(line: 71, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 72, type: !22)
!107 = !DILocation(line: 72, column: 13, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 73, type: !27)
!109 = !DILocation(line: 73, column: 13, scope: !103)
!110 = !DILocation(line: 74, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !12, line: 74, column: 8)
!112 = !DILocation(line: 74, column: 8, scope: !103)
!113 = !DILocation(line: 77, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 75, column: 5)
!115 = !DILocation(line: 78, column: 5, scope: !114)
!116 = !DILocation(line: 82, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !12, line: 80, column: 5)
!118 = !DILocation(line: 82, column: 14, scope: !117)
!119 = !DILocation(line: 83, column: 9, scope: !117)
!120 = !DILocation(line: 83, column: 17, scope: !117)
!121 = !DILocalVariable(name: "i", scope: !122, file: !12, line: 86, type: !42)
!122 = distinct !DILexicalBlock(scope: !103, file: !12, line: 85, column: 5)
!123 = !DILocation(line: 86, column: 16, scope: !122)
!124 = !DILocalVariable(name: "source", scope: !122, file: !12, line: 87, type: !27)
!125 = !DILocation(line: 87, column: 17, scope: !122)
!126 = !DILocation(line: 88, column: 17, scope: !122)
!127 = !DILocation(line: 88, column: 9, scope: !122)
!128 = !DILocation(line: 89, column: 9, scope: !122)
!129 = !DILocation(line: 89, column: 23, scope: !122)
!130 = !DILocation(line: 91, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !122, file: !12, line: 91, column: 9)
!132 = !DILocation(line: 91, column: 14, scope: !131)
!133 = !DILocation(line: 91, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 91, column: 9)
!135 = !DILocation(line: 91, column: 23, scope: !134)
!136 = !DILocation(line: 91, column: 9, scope: !131)
!137 = !DILocation(line: 93, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 92, column: 9)
!139 = !DILocation(line: 93, column: 23, scope: !138)
!140 = !DILocation(line: 93, column: 13, scope: !138)
!141 = !DILocation(line: 93, column: 18, scope: !138)
!142 = !DILocation(line: 93, column: 21, scope: !138)
!143 = !DILocation(line: 94, column: 9, scope: !138)
!144 = !DILocation(line: 91, column: 31, scope: !134)
!145 = !DILocation(line: 91, column: 9, scope: !134)
!146 = distinct !{!146, !136, !147, !69}
!147 = !DILocation(line: 94, column: 9, scope: !131)
!148 = !DILocation(line: 95, column: 9, scope: !122)
!149 = !DILocation(line: 95, column: 21, scope: !122)
!150 = !DILocation(line: 96, column: 20, scope: !122)
!151 = !DILocation(line: 96, column: 9, scope: !122)
!152 = !DILocation(line: 98, column: 1, scope: !103)
!153 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !100, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocation(line: 32, column: 5, scope: !153)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!156 = !DILocalVariable(name: "data", scope: !155, file: !12, line: 103, type: !16)
!157 = !DILocation(line: 103, column: 15, scope: !155)
!158 = !DILocalVariable(name: "dataBadBuffer", scope: !155, file: !12, line: 104, type: !22)
!159 = !DILocation(line: 104, column: 13, scope: !155)
!160 = !DILocalVariable(name: "dataGoodBuffer", scope: !155, file: !12, line: 105, type: !27)
!161 = !DILocation(line: 105, column: 13, scope: !155)
!162 = !DILocation(line: 106, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !155, file: !12, line: 106, column: 8)
!164 = !DILocation(line: 106, column: 8, scope: !155)
!165 = !DILocation(line: 109, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 107, column: 5)
!167 = !DILocation(line: 109, column: 14, scope: !166)
!168 = !DILocation(line: 110, column: 9, scope: !166)
!169 = !DILocation(line: 110, column: 17, scope: !166)
!170 = !DILocation(line: 111, column: 5, scope: !166)
!171 = !DILocalVariable(name: "i", scope: !172, file: !12, line: 113, type: !42)
!172 = distinct !DILexicalBlock(scope: !155, file: !12, line: 112, column: 5)
!173 = !DILocation(line: 113, column: 16, scope: !172)
!174 = !DILocalVariable(name: "source", scope: !172, file: !12, line: 114, type: !27)
!175 = !DILocation(line: 114, column: 17, scope: !172)
!176 = !DILocation(line: 115, column: 17, scope: !172)
!177 = !DILocation(line: 115, column: 9, scope: !172)
!178 = !DILocation(line: 116, column: 9, scope: !172)
!179 = !DILocation(line: 116, column: 23, scope: !172)
!180 = !DILocation(line: 118, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !172, file: !12, line: 118, column: 9)
!182 = !DILocation(line: 118, column: 14, scope: !181)
!183 = !DILocation(line: 118, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !12, line: 118, column: 9)
!185 = !DILocation(line: 118, column: 23, scope: !184)
!186 = !DILocation(line: 118, column: 9, scope: !181)
!187 = !DILocation(line: 120, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !12, line: 119, column: 9)
!189 = !DILocation(line: 120, column: 23, scope: !188)
!190 = !DILocation(line: 120, column: 13, scope: !188)
!191 = !DILocation(line: 120, column: 18, scope: !188)
!192 = !DILocation(line: 120, column: 21, scope: !188)
!193 = !DILocation(line: 121, column: 9, scope: !188)
!194 = !DILocation(line: 118, column: 31, scope: !184)
!195 = !DILocation(line: 118, column: 9, scope: !184)
!196 = distinct !{!196, !186, !197, !69}
!197 = !DILocation(line: 121, column: 9, scope: !181)
!198 = !DILocation(line: 122, column: 9, scope: !172)
!199 = !DILocation(line: 122, column: 21, scope: !172)
!200 = !DILocation(line: 123, column: 20, scope: !172)
!201 = !DILocation(line: 123, column: 9, scope: !172)
!202 = !DILocation(line: 125, column: 1, scope: !155)
