; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05_bad() #0 !dbg !18 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !21, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  %0 = load i32, i32* @staticTrue, align 4, !dbg !40
  %tobool = icmp ne i32 %0, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %1, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !65
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !66
  store i32 0, i32* %intOne, align 8, !dbg !67
  %3 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !69
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !70
  store i32 0, i32* %intTwo, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %4, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !79
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !79
  %7 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !79
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !79
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !80
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #5, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #5, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = load i32, i32* @staticFalse, align 4, !dbg !114
  %tobool = icmp ne i32 %0, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !132
  %cmp = icmp ult i64 %1, 100, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !138
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !139
  store i32 0, i32* %intOne, align 8, !dbg !140
  %3 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !142
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !143
  store i32 0, i32* %intTwo, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %4, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !150
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !151
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !151
  %7 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !151
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !151
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !152
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = load i32, i32* @staticTrue, align 4, !dbg !162
  %tobool = icmp ne i32 %0, 0, !dbg !162
  br i1 %tobool, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !165
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !167
  br label %if.end, !dbg !168

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !169, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i64* %i, metadata !172, metadata !DIExpression()), !dbg !174
  store i64 0, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !178
  %cmp = icmp ult i64 %1, 100, !dbg !180
  br i1 %cmp, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !184
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !185
  store i32 0, i32* %intOne, align 8, !dbg !186
  %3 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !188
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !189
  store i32 0, i32* %intTwo, align 4, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %4, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !196
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !197
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !197
  %7 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !197
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !197
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !198
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !198
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !199
  ret void, !dbg !200
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !24, line: 100, baseType: !25)
!24 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !24, line: 96, size: 64, elements: !26)
!26 = !{!27, !28}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !25, file: !24, line: 98, baseType: !11, size: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !25, file: !24, line: 99, baseType: !11, size: 32, offset: 32)
!29 = !DILocation(line: 30, column: 21, scope: !18)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 31, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 31, column: 19, scope: !18)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 32, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 32, column: 19, scope: !18)
!40 = !DILocation(line: 33, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !18, file: !10, line: 33, column: 8)
!42 = !DILocation(line: 33, column: 8, scope: !18)
!43 = !DILocation(line: 37, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !10, line: 34, column: 5)
!45 = !DILocation(line: 37, column: 14, scope: !44)
!46 = !DILocation(line: 38, column: 5, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !10, line: 40, type: !36)
!48 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 5)
!49 = !DILocation(line: 40, column: 23, scope: !48)
!50 = !DILocalVariable(name: "i", scope: !51, file: !10, line: 42, type: !52)
!51 = distinct !DILexicalBlock(scope: !48, file: !10, line: 41, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 46, baseType: !54)
!53 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 42, column: 20, scope: !51)
!56 = !DILocation(line: 44, column: 20, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !10, line: 44, column: 13)
!58 = !DILocation(line: 44, column: 18, scope: !57)
!59 = !DILocation(line: 44, column: 25, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !10, line: 44, column: 13)
!61 = !DILocation(line: 44, column: 27, scope: !60)
!62 = !DILocation(line: 44, column: 13, scope: !57)
!63 = !DILocation(line: 46, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !10, line: 45, column: 13)
!65 = !DILocation(line: 46, column: 17, scope: !64)
!66 = !DILocation(line: 46, column: 27, scope: !64)
!67 = !DILocation(line: 46, column: 34, scope: !64)
!68 = !DILocation(line: 47, column: 24, scope: !64)
!69 = !DILocation(line: 47, column: 17, scope: !64)
!70 = !DILocation(line: 47, column: 27, scope: !64)
!71 = !DILocation(line: 47, column: 34, scope: !64)
!72 = !DILocation(line: 48, column: 13, scope: !64)
!73 = !DILocation(line: 44, column: 35, scope: !60)
!74 = !DILocation(line: 44, column: 13, scope: !60)
!75 = distinct !{!75, !62, !76, !77}
!76 = !DILocation(line: 48, column: 13, scope: !57)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 51, column: 17, scope: !48)
!79 = !DILocation(line: 51, column: 9, scope: !48)
!80 = !DILocation(line: 52, column: 26, scope: !48)
!81 = !DILocation(line: 52, column: 9, scope: !48)
!82 = !DILocation(line: 54, column: 1, scope: !18)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_05_good", scope: !10, file: !10, line: 121, type: !19, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocation(line: 123, column: 5, scope: !83)
!85 = !DILocation(line: 124, column: 5, scope: !83)
!86 = !DILocation(line: 125, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 137, type: !88, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!88 = !DISubroutineType(types: !89)
!89 = !{!11, !11, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !10, line: 137, type: !11)
!94 = !DILocation(line: 137, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !10, line: 137, type: !90)
!96 = !DILocation(line: 137, column: 27, scope: !87)
!97 = !DILocation(line: 140, column: 22, scope: !87)
!98 = !DILocation(line: 140, column: 12, scope: !87)
!99 = !DILocation(line: 140, column: 5, scope: !87)
!100 = !DILocation(line: 142, column: 5, scope: !87)
!101 = !DILocation(line: 143, column: 5, scope: !87)
!102 = !DILocation(line: 144, column: 5, scope: !87)
!103 = !DILocation(line: 147, column: 5, scope: !87)
!104 = !DILocation(line: 148, column: 5, scope: !87)
!105 = !DILocation(line: 149, column: 5, scope: !87)
!106 = !DILocation(line: 151, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !10, line: 63, type: !22)
!109 = !DILocation(line: 63, column: 21, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !10, line: 64, type: !31)
!111 = !DILocation(line: 64, column: 19, scope: !107)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !10, line: 65, type: !36)
!113 = !DILocation(line: 65, column: 19, scope: !107)
!114 = !DILocation(line: 66, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !10, line: 66, column: 8)
!116 = !DILocation(line: 66, column: 8, scope: !107)
!117 = !DILocation(line: 69, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !10, line: 67, column: 5)
!119 = !DILocation(line: 70, column: 5, scope: !118)
!120 = !DILocation(line: 74, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !10, line: 72, column: 5)
!122 = !DILocation(line: 74, column: 14, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !124, file: !10, line: 77, type: !36)
!124 = distinct !DILexicalBlock(scope: !107, file: !10, line: 76, column: 5)
!125 = !DILocation(line: 77, column: 23, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !127, file: !10, line: 79, type: !52)
!127 = distinct !DILexicalBlock(scope: !124, file: !10, line: 78, column: 9)
!128 = !DILocation(line: 79, column: 20, scope: !127)
!129 = !DILocation(line: 81, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !10, line: 81, column: 13)
!131 = !DILocation(line: 81, column: 18, scope: !130)
!132 = !DILocation(line: 81, column: 25, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !10, line: 81, column: 13)
!134 = !DILocation(line: 81, column: 27, scope: !133)
!135 = !DILocation(line: 81, column: 13, scope: !130)
!136 = !DILocation(line: 83, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !10, line: 82, column: 13)
!138 = !DILocation(line: 83, column: 17, scope: !137)
!139 = !DILocation(line: 83, column: 27, scope: !137)
!140 = !DILocation(line: 83, column: 34, scope: !137)
!141 = !DILocation(line: 84, column: 24, scope: !137)
!142 = !DILocation(line: 84, column: 17, scope: !137)
!143 = !DILocation(line: 84, column: 27, scope: !137)
!144 = !DILocation(line: 84, column: 34, scope: !137)
!145 = !DILocation(line: 85, column: 13, scope: !137)
!146 = !DILocation(line: 81, column: 35, scope: !133)
!147 = !DILocation(line: 81, column: 13, scope: !133)
!148 = distinct !{!148, !135, !149, !77}
!149 = !DILocation(line: 85, column: 13, scope: !130)
!150 = !DILocation(line: 88, column: 17, scope: !124)
!151 = !DILocation(line: 88, column: 9, scope: !124)
!152 = !DILocation(line: 89, column: 26, scope: !124)
!153 = !DILocation(line: 89, column: 9, scope: !124)
!154 = !DILocation(line: 91, column: 1, scope: !107)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DILocalVariable(name: "data", scope: !155, file: !10, line: 96, type: !22)
!157 = !DILocation(line: 96, column: 21, scope: !155)
!158 = !DILocalVariable(name: "dataBadBuffer", scope: !155, file: !10, line: 97, type: !31)
!159 = !DILocation(line: 97, column: 19, scope: !155)
!160 = !DILocalVariable(name: "dataGoodBuffer", scope: !155, file: !10, line: 98, type: !36)
!161 = !DILocation(line: 98, column: 19, scope: !155)
!162 = !DILocation(line: 99, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !155, file: !10, line: 99, column: 8)
!164 = !DILocation(line: 99, column: 8, scope: !155)
!165 = !DILocation(line: 102, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !10, line: 100, column: 5)
!167 = !DILocation(line: 102, column: 14, scope: !166)
!168 = !DILocation(line: 103, column: 5, scope: !166)
!169 = !DILocalVariable(name: "source", scope: !170, file: !10, line: 105, type: !36)
!170 = distinct !DILexicalBlock(scope: !155, file: !10, line: 104, column: 5)
!171 = !DILocation(line: 105, column: 23, scope: !170)
!172 = !DILocalVariable(name: "i", scope: !173, file: !10, line: 107, type: !52)
!173 = distinct !DILexicalBlock(scope: !170, file: !10, line: 106, column: 9)
!174 = !DILocation(line: 107, column: 20, scope: !173)
!175 = !DILocation(line: 109, column: 20, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !10, line: 109, column: 13)
!177 = !DILocation(line: 109, column: 18, scope: !176)
!178 = !DILocation(line: 109, column: 25, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !10, line: 109, column: 13)
!180 = !DILocation(line: 109, column: 27, scope: !179)
!181 = !DILocation(line: 109, column: 13, scope: !176)
!182 = !DILocation(line: 111, column: 24, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !10, line: 110, column: 13)
!184 = !DILocation(line: 111, column: 17, scope: !183)
!185 = !DILocation(line: 111, column: 27, scope: !183)
!186 = !DILocation(line: 111, column: 34, scope: !183)
!187 = !DILocation(line: 112, column: 24, scope: !183)
!188 = !DILocation(line: 112, column: 17, scope: !183)
!189 = !DILocation(line: 112, column: 27, scope: !183)
!190 = !DILocation(line: 112, column: 34, scope: !183)
!191 = !DILocation(line: 113, column: 13, scope: !183)
!192 = !DILocation(line: 109, column: 35, scope: !179)
!193 = !DILocation(line: 109, column: 13, scope: !179)
!194 = distinct !{!194, !181, !195, !77}
!195 = !DILocation(line: 113, column: 13, scope: !176)
!196 = !DILocation(line: 116, column: 17, scope: !170)
!197 = !DILocation(line: 116, column: 9, scope: !170)
!198 = !DILocation(line: 117, column: 26, scope: !170)
!199 = !DILocation(line: 117, column: 9, scope: !170)
!200 = !DILocation(line: 119, column: 1, scope: !155)
