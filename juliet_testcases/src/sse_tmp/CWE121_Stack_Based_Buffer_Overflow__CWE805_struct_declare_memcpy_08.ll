; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %call = call i32 @staticReturnsTrue(), !dbg !35
  %tobool = icmp ne i32 %call, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %0, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %2 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %3, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !74
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !74
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !74
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !75
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #5, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #5, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !102 {
entry:
  ret i32 1, !dbg !105
}

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
  %call = call i32 @staticReturnsFalse(), !dbg !113
  %tobool = icmp ne i32 %call, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !131
  %cmp = icmp ult i64 %0, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !137
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !138
  store i32 0, i32* %intOne, align 8, !dbg !139
  %2 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !141
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !142
  store i32 0, i32* %intTwo, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %3, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !149
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !150
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !150
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !150
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !150
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !151
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !151
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !154 {
entry:
  ret i32 0, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %call = call i32 @staticReturnsTrue(), !dbg !163
  %tobool = icmp ne i32 %call, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end, !dbg !165

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
  %0 = load i64, i64* %i, align 8, !dbg !179
  %cmp = icmp ult i64 %0, 100, !dbg !181
  br i1 %cmp, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !185
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !186
  store i32 0, i32* %intOne, align 8, !dbg !187
  %2 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !189
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !190
  store i32 0, i32* %intTwo, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !193
  %inc = add i64 %3, 1, !dbg !193
  store i64 %inc, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !197
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !198
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !198
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !198
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !198
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !199
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !199
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !200
  ret void, !dbg !201
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 37, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 38, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 39, column: 19, scope: !11)
!35 = !DILocation(line: 40, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!37 = !DILocation(line: 40, column: 8, scope: !11)
!38 = !DILocation(line: 44, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 41, column: 5)
!40 = !DILocation(line: 44, column: 14, scope: !39)
!41 = !DILocation(line: 45, column: 5, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 47, type: !31)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!44 = !DILocation(line: 47, column: 23, scope: !43)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 49, type: !47)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 48, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 49, column: 20, scope: !46)
!51 = !DILocation(line: 51, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !12, line: 51, column: 13)
!53 = !DILocation(line: 51, column: 18, scope: !52)
!54 = !DILocation(line: 51, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 51, column: 13)
!56 = !DILocation(line: 51, column: 27, scope: !55)
!57 = !DILocation(line: 51, column: 13, scope: !52)
!58 = !DILocation(line: 53, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 52, column: 13)
!60 = !DILocation(line: 53, column: 17, scope: !59)
!61 = !DILocation(line: 53, column: 27, scope: !59)
!62 = !DILocation(line: 53, column: 34, scope: !59)
!63 = !DILocation(line: 54, column: 24, scope: !59)
!64 = !DILocation(line: 54, column: 17, scope: !59)
!65 = !DILocation(line: 54, column: 27, scope: !59)
!66 = !DILocation(line: 54, column: 34, scope: !59)
!67 = !DILocation(line: 55, column: 13, scope: !59)
!68 = !DILocation(line: 51, column: 35, scope: !55)
!69 = !DILocation(line: 51, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 55, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 58, column: 16, scope: !43)
!74 = !DILocation(line: 58, column: 9, scope: !43)
!75 = !DILocation(line: 59, column: 26, scope: !43)
!76 = !DILocation(line: 59, column: 9, scope: !43)
!77 = !DILocation(line: 61, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_good", scope: !12, file: !12, line: 128, type: !13, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 130, column: 5, scope: !78)
!80 = !DILocation(line: 131, column: 5, scope: !78)
!81 = !DILocation(line: 132, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 144, type: !83, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!22, !22, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 144, type: !22)
!89 = !DILocation(line: 144, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 144, type: !85)
!91 = !DILocation(line: 144, column: 27, scope: !82)
!92 = !DILocation(line: 147, column: 22, scope: !82)
!93 = !DILocation(line: 147, column: 12, scope: !82)
!94 = !DILocation(line: 147, column: 5, scope: !82)
!95 = !DILocation(line: 149, column: 5, scope: !82)
!96 = !DILocation(line: 150, column: 5, scope: !82)
!97 = !DILocation(line: 151, column: 5, scope: !82)
!98 = !DILocation(line: 154, column: 5, scope: !82)
!99 = !DILocation(line: 155, column: 5, scope: !82)
!100 = !DILocation(line: 156, column: 5, scope: !82)
!101 = !DILocation(line: 158, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !103, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DISubroutineType(types: !104)
!104 = !{!22}
!105 = !DILocation(line: 25, column: 5, scope: !102)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 70, type: !16)
!108 = !DILocation(line: 70, column: 21, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !12, line: 71, type: !26)
!110 = !DILocation(line: 71, column: 19, scope: !106)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !12, line: 72, type: !31)
!112 = !DILocation(line: 72, column: 19, scope: !106)
!113 = !DILocation(line: 73, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !12, line: 73, column: 8)
!115 = !DILocation(line: 73, column: 8, scope: !106)
!116 = !DILocation(line: 76, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 74, column: 5)
!118 = !DILocation(line: 77, column: 5, scope: !117)
!119 = !DILocation(line: 81, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !12, line: 79, column: 5)
!121 = !DILocation(line: 81, column: 14, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !123, file: !12, line: 84, type: !31)
!123 = distinct !DILexicalBlock(scope: !106, file: !12, line: 83, column: 5)
!124 = !DILocation(line: 84, column: 23, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 86, type: !47)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 85, column: 9)
!127 = !DILocation(line: 86, column: 20, scope: !126)
!128 = !DILocation(line: 88, column: 20, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 88, column: 13)
!130 = !DILocation(line: 88, column: 18, scope: !129)
!131 = !DILocation(line: 88, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 88, column: 13)
!133 = !DILocation(line: 88, column: 27, scope: !132)
!134 = !DILocation(line: 88, column: 13, scope: !129)
!135 = !DILocation(line: 90, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 89, column: 13)
!137 = !DILocation(line: 90, column: 17, scope: !136)
!138 = !DILocation(line: 90, column: 27, scope: !136)
!139 = !DILocation(line: 90, column: 34, scope: !136)
!140 = !DILocation(line: 91, column: 24, scope: !136)
!141 = !DILocation(line: 91, column: 17, scope: !136)
!142 = !DILocation(line: 91, column: 27, scope: !136)
!143 = !DILocation(line: 91, column: 34, scope: !136)
!144 = !DILocation(line: 92, column: 13, scope: !136)
!145 = !DILocation(line: 88, column: 35, scope: !132)
!146 = !DILocation(line: 88, column: 13, scope: !132)
!147 = distinct !{!147, !134, !148, !72}
!148 = !DILocation(line: 92, column: 13, scope: !129)
!149 = !DILocation(line: 95, column: 16, scope: !123)
!150 = !DILocation(line: 95, column: 9, scope: !123)
!151 = !DILocation(line: 96, column: 26, scope: !123)
!152 = !DILocation(line: 96, column: 9, scope: !123)
!153 = !DILocation(line: 98, column: 1, scope: !106)
!154 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !103, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!155 = !DILocation(line: 30, column: 5, scope: !154)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "data", scope: !156, file: !12, line: 103, type: !16)
!158 = !DILocation(line: 103, column: 21, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !12, line: 104, type: !26)
!160 = !DILocation(line: 104, column: 19, scope: !156)
!161 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !12, line: 105, type: !31)
!162 = !DILocation(line: 105, column: 19, scope: !156)
!163 = !DILocation(line: 106, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !12, line: 106, column: 8)
!165 = !DILocation(line: 106, column: 8, scope: !156)
!166 = !DILocation(line: 109, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !12, line: 107, column: 5)
!168 = !DILocation(line: 109, column: 14, scope: !167)
!169 = !DILocation(line: 110, column: 5, scope: !167)
!170 = !DILocalVariable(name: "source", scope: !171, file: !12, line: 112, type: !31)
!171 = distinct !DILexicalBlock(scope: !156, file: !12, line: 111, column: 5)
!172 = !DILocation(line: 112, column: 23, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !174, file: !12, line: 114, type: !47)
!174 = distinct !DILexicalBlock(scope: !171, file: !12, line: 113, column: 9)
!175 = !DILocation(line: 114, column: 20, scope: !174)
!176 = !DILocation(line: 116, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !12, line: 116, column: 13)
!178 = !DILocation(line: 116, column: 18, scope: !177)
!179 = !DILocation(line: 116, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !12, line: 116, column: 13)
!181 = !DILocation(line: 116, column: 27, scope: !180)
!182 = !DILocation(line: 116, column: 13, scope: !177)
!183 = !DILocation(line: 118, column: 24, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !12, line: 117, column: 13)
!185 = !DILocation(line: 118, column: 17, scope: !184)
!186 = !DILocation(line: 118, column: 27, scope: !184)
!187 = !DILocation(line: 118, column: 34, scope: !184)
!188 = !DILocation(line: 119, column: 24, scope: !184)
!189 = !DILocation(line: 119, column: 17, scope: !184)
!190 = !DILocation(line: 119, column: 27, scope: !184)
!191 = !DILocation(line: 119, column: 34, scope: !184)
!192 = !DILocation(line: 120, column: 13, scope: !184)
!193 = !DILocation(line: 116, column: 35, scope: !180)
!194 = !DILocation(line: 116, column: 13, scope: !180)
!195 = distinct !{!195, !182, !196, !72}
!196 = !DILocation(line: 120, column: 13, scope: !177)
!197 = !DILocation(line: 123, column: 16, scope: !171)
!198 = !DILocation(line: 123, column: 9, scope: !171)
!199 = !DILocation(line: 124, column: 26, scope: !171)
!200 = !DILocation(line: 124, column: 9, scope: !171)
!201 = !DILocation(line: 126, column: 1, scope: !156)
