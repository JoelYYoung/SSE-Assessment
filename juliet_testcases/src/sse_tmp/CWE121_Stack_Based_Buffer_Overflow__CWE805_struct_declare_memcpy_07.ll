; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !19, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* @staticFive, align 4, !dbg !38
  %cmp = icmp eq i32 %0, 5, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !46, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !58
  %cmp1 = icmp ult i64 %1, 100, !dbg !60
  br i1 %cmp1, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !64
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !65
  store i32 0, i32* %intOne, align 8, !dbg !66
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !68
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !69
  store i32 0, i32* %intTwo, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %4, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !78
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !78
  %7 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !78
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !78
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !79
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07_good() #0 !dbg !82 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = load i32, i32* @staticFive, align 4, !dbg !113
  %cmp = icmp ne i32 %0, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.else, !dbg !116

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
  %cmp1 = icmp ult i64 %1, 100, !dbg !134
  br i1 %cmp1, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !138
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !139
  store i32 0, i32* %intOne, align 8, !dbg !140
  %3 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !142
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !143
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
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !151
  %7 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !151
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !151
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !152
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !153
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !162
  %cmp = icmp eq i32 %0, 5, !dbg !164
  br i1 %cmp, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !166
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !175
  store i64 0, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !179
  %cmp1 = icmp ult i64 %1, 100, !dbg !181
  br i1 %cmp1, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !185
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !186
  store i32 0, i32* %intOne, align 8, !dbg !187
  %3 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !189
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !190
  store i32 0, i32* %intTwo, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !193
  %inc = add i64 %4, 1, !dbg !193
  store i64 %inc, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !197
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !198
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !198
  %7 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !198
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !198
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !199
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !199
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !200
  ret void, !dbg !201
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 29, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !22, line: 100, baseType: !23)
!22 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !22, line: 96, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !23, file: !22, line: 98, baseType: !9, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !23, file: !22, line: 99, baseType: !9, size: 32, offset: 32)
!27 = !DILocation(line: 29, column: 21, scope: !16)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 30, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 30, column: 19, scope: !16)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 31, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 31, column: 19, scope: !16)
!38 = !DILocation(line: 32, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !16, file: !8, line: 32, column: 8)
!40 = !DILocation(line: 32, column: 18, scope: !39)
!41 = !DILocation(line: 32, column: 8, scope: !16)
!42 = !DILocation(line: 36, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !8, line: 33, column: 5)
!44 = !DILocation(line: 36, column: 14, scope: !43)
!45 = !DILocation(line: 37, column: 5, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !8, line: 39, type: !34)
!47 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 23, scope: !47)
!49 = !DILocalVariable(name: "i", scope: !50, file: !8, line: 41, type: !51)
!50 = distinct !DILexicalBlock(scope: !47, file: !8, line: 40, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 41, column: 20, scope: !50)
!55 = !DILocation(line: 43, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !8, line: 43, column: 13)
!57 = !DILocation(line: 43, column: 18, scope: !56)
!58 = !DILocation(line: 43, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !8, line: 43, column: 13)
!60 = !DILocation(line: 43, column: 27, scope: !59)
!61 = !DILocation(line: 43, column: 13, scope: !56)
!62 = !DILocation(line: 45, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !8, line: 44, column: 13)
!64 = !DILocation(line: 45, column: 17, scope: !63)
!65 = !DILocation(line: 45, column: 27, scope: !63)
!66 = !DILocation(line: 45, column: 34, scope: !63)
!67 = !DILocation(line: 46, column: 24, scope: !63)
!68 = !DILocation(line: 46, column: 17, scope: !63)
!69 = !DILocation(line: 46, column: 27, scope: !63)
!70 = !DILocation(line: 46, column: 34, scope: !63)
!71 = !DILocation(line: 47, column: 13, scope: !63)
!72 = !DILocation(line: 43, column: 35, scope: !59)
!73 = !DILocation(line: 43, column: 13, scope: !59)
!74 = distinct !{!74, !61, !75, !76}
!75 = !DILocation(line: 47, column: 13, scope: !56)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 50, column: 16, scope: !47)
!78 = !DILocation(line: 50, column: 9, scope: !47)
!79 = !DILocation(line: 51, column: 26, scope: !47)
!80 = !DILocation(line: 51, column: 9, scope: !47)
!81 = !DILocation(line: 53, column: 1, scope: !16)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_07_good", scope: !8, file: !8, line: 120, type: !17, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocation(line: 122, column: 5, scope: !82)
!84 = !DILocation(line: 123, column: 5, scope: !82)
!85 = !DILocation(line: 124, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 136, type: !87, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DISubroutineType(types: !88)
!88 = !{!9, !9, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !8, line: 136, type: !9)
!93 = !DILocation(line: 136, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !8, line: 136, type: !89)
!95 = !DILocation(line: 136, column: 27, scope: !86)
!96 = !DILocation(line: 139, column: 22, scope: !86)
!97 = !DILocation(line: 139, column: 12, scope: !86)
!98 = !DILocation(line: 139, column: 5, scope: !86)
!99 = !DILocation(line: 141, column: 5, scope: !86)
!100 = !DILocation(line: 142, column: 5, scope: !86)
!101 = !DILocation(line: 143, column: 5, scope: !86)
!102 = !DILocation(line: 146, column: 5, scope: !86)
!103 = !DILocation(line: 147, column: 5, scope: !86)
!104 = !DILocation(line: 148, column: 5, scope: !86)
!105 = !DILocation(line: 150, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !8, line: 62, type: !20)
!108 = !DILocation(line: 62, column: 21, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !8, line: 63, type: !29)
!110 = !DILocation(line: 63, column: 19, scope: !106)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !8, line: 64, type: !34)
!112 = !DILocation(line: 64, column: 19, scope: !106)
!113 = !DILocation(line: 65, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !8, line: 65, column: 8)
!115 = !DILocation(line: 65, column: 18, scope: !114)
!116 = !DILocation(line: 65, column: 8, scope: !106)
!117 = !DILocation(line: 68, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !8, line: 66, column: 5)
!119 = !DILocation(line: 69, column: 5, scope: !118)
!120 = !DILocation(line: 73, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !114, file: !8, line: 71, column: 5)
!122 = !DILocation(line: 73, column: 14, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !124, file: !8, line: 76, type: !34)
!124 = distinct !DILexicalBlock(scope: !106, file: !8, line: 75, column: 5)
!125 = !DILocation(line: 76, column: 23, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !127, file: !8, line: 78, type: !51)
!127 = distinct !DILexicalBlock(scope: !124, file: !8, line: 77, column: 9)
!128 = !DILocation(line: 78, column: 20, scope: !127)
!129 = !DILocation(line: 80, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !8, line: 80, column: 13)
!131 = !DILocation(line: 80, column: 18, scope: !130)
!132 = !DILocation(line: 80, column: 25, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !8, line: 80, column: 13)
!134 = !DILocation(line: 80, column: 27, scope: !133)
!135 = !DILocation(line: 80, column: 13, scope: !130)
!136 = !DILocation(line: 82, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !8, line: 81, column: 13)
!138 = !DILocation(line: 82, column: 17, scope: !137)
!139 = !DILocation(line: 82, column: 27, scope: !137)
!140 = !DILocation(line: 82, column: 34, scope: !137)
!141 = !DILocation(line: 83, column: 24, scope: !137)
!142 = !DILocation(line: 83, column: 17, scope: !137)
!143 = !DILocation(line: 83, column: 27, scope: !137)
!144 = !DILocation(line: 83, column: 34, scope: !137)
!145 = !DILocation(line: 84, column: 13, scope: !137)
!146 = !DILocation(line: 80, column: 35, scope: !133)
!147 = !DILocation(line: 80, column: 13, scope: !133)
!148 = distinct !{!148, !135, !149, !76}
!149 = !DILocation(line: 84, column: 13, scope: !130)
!150 = !DILocation(line: 87, column: 16, scope: !124)
!151 = !DILocation(line: 87, column: 9, scope: !124)
!152 = !DILocation(line: 88, column: 26, scope: !124)
!153 = !DILocation(line: 88, column: 9, scope: !124)
!154 = !DILocation(line: 90, column: 1, scope: !106)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DILocalVariable(name: "data", scope: !155, file: !8, line: 95, type: !20)
!157 = !DILocation(line: 95, column: 21, scope: !155)
!158 = !DILocalVariable(name: "dataBadBuffer", scope: !155, file: !8, line: 96, type: !29)
!159 = !DILocation(line: 96, column: 19, scope: !155)
!160 = !DILocalVariable(name: "dataGoodBuffer", scope: !155, file: !8, line: 97, type: !34)
!161 = !DILocation(line: 97, column: 19, scope: !155)
!162 = !DILocation(line: 98, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !155, file: !8, line: 98, column: 8)
!164 = !DILocation(line: 98, column: 18, scope: !163)
!165 = !DILocation(line: 98, column: 8, scope: !155)
!166 = !DILocation(line: 101, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !8, line: 99, column: 5)
!168 = !DILocation(line: 101, column: 14, scope: !167)
!169 = !DILocation(line: 102, column: 5, scope: !167)
!170 = !DILocalVariable(name: "source", scope: !171, file: !8, line: 104, type: !34)
!171 = distinct !DILexicalBlock(scope: !155, file: !8, line: 103, column: 5)
!172 = !DILocation(line: 104, column: 23, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !174, file: !8, line: 106, type: !51)
!174 = distinct !DILexicalBlock(scope: !171, file: !8, line: 105, column: 9)
!175 = !DILocation(line: 106, column: 20, scope: !174)
!176 = !DILocation(line: 108, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !8, line: 108, column: 13)
!178 = !DILocation(line: 108, column: 18, scope: !177)
!179 = !DILocation(line: 108, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !8, line: 108, column: 13)
!181 = !DILocation(line: 108, column: 27, scope: !180)
!182 = !DILocation(line: 108, column: 13, scope: !177)
!183 = !DILocation(line: 110, column: 24, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !8, line: 109, column: 13)
!185 = !DILocation(line: 110, column: 17, scope: !184)
!186 = !DILocation(line: 110, column: 27, scope: !184)
!187 = !DILocation(line: 110, column: 34, scope: !184)
!188 = !DILocation(line: 111, column: 24, scope: !184)
!189 = !DILocation(line: 111, column: 17, scope: !184)
!190 = !DILocation(line: 111, column: 27, scope: !184)
!191 = !DILocation(line: 111, column: 34, scope: !184)
!192 = !DILocation(line: 112, column: 13, scope: !184)
!193 = !DILocation(line: 108, column: 35, scope: !180)
!194 = !DILocation(line: 108, column: 13, scope: !180)
!195 = distinct !{!195, !182, !196, !76}
!196 = !DILocation(line: 112, column: 13, scope: !177)
!197 = !DILocation(line: 115, column: 16, scope: !171)
!198 = !DILocation(line: 115, column: 9, scope: !171)
!199 = !DILocation(line: 116, column: 26, scope: !171)
!200 = !DILocation(line: 116, column: 9, scope: !171)
!201 = !DILocation(line: 118, column: 1, scope: !155)
