; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !27
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !30
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !53
  %cmp1 = icmp ult i64 %2, 100, !dbg !55
  br i1 %cmp1, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !59
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !60
  store i32 0, i32* %intOne, align 8, !dbg !61
  %4 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !63
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !64
  store i32 0, i32* %intTwo, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %5, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !73
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !73
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !73
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !73
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !74
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !75
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !76
  call void @free(i8* %11) #6, !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #6, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #6, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !107
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !110
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !111
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !112
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !127
  %cmp1 = icmp ult i64 %2, 100, !dbg !129
  br i1 %cmp1, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !133
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !134
  store i32 0, i32* %intOne, align 8, !dbg !135
  %4 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !137
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !138
  store i32 0, i32* %intTwo, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %5, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !146
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !146
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !146
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !146
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !147
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !148
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !149
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !149
  call void @free(i8* %11) #6, !dbg !150
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !152 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !153, metadata !DIExpression()), !dbg !154
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !156
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !159
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !160
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !161
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !163
  br i1 %cmp, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !165
  unreachable, !dbg !165

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !167, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  store i64 0, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !176
  %cmp1 = icmp ult i64 %2, 100, !dbg !178
  br i1 %cmp1, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !182
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !183
  store i32 0, i32* %intOne, align 8, !dbg !184
  %4 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !186
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !187
  store i32 0, i32* %intTwo, align 4, !dbg !188
  br label %for.inc, !dbg !189

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !190
  %inc = add i64 %5, 1, !dbg !190
  store i64 %inc, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !191, !llvm.loop !192

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !194
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !195
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !195
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !195
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !195
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !196
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !196
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !197
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !198
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !198
  call void @free(i8* %11) #6, !dbg !199
  ret void, !dbg !200
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 28, column: 33, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !21, line: 26, column: 5)
!29 = distinct !DILexicalBlock(scope: !20, file: !21, line: 25, column: 8)
!30 = !DILocation(line: 28, column: 16, scope: !28)
!31 = !DILocation(line: 28, column: 14, scope: !28)
!32 = !DILocation(line: 29, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !21, line: 29, column: 13)
!34 = !DILocation(line: 29, column: 18, scope: !33)
!35 = !DILocation(line: 29, column: 13, scope: !28)
!36 = !DILocation(line: 29, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !21, line: 29, column: 27)
!38 = !DILocalVariable(name: "source", scope: !39, file: !21, line: 32, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !21, line: 31, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 32, column: 23, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !21, line: 34, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !21, line: 33, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 34, column: 20, scope: !45)
!50 = !DILocation(line: 36, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !21, line: 36, column: 13)
!52 = !DILocation(line: 36, column: 18, scope: !51)
!53 = !DILocation(line: 36, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !21, line: 36, column: 13)
!55 = !DILocation(line: 36, column: 27, scope: !54)
!56 = !DILocation(line: 36, column: 13, scope: !51)
!57 = !DILocation(line: 38, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !21, line: 37, column: 13)
!59 = !DILocation(line: 38, column: 17, scope: !58)
!60 = !DILocation(line: 38, column: 27, scope: !58)
!61 = !DILocation(line: 38, column: 34, scope: !58)
!62 = !DILocation(line: 39, column: 24, scope: !58)
!63 = !DILocation(line: 39, column: 17, scope: !58)
!64 = !DILocation(line: 39, column: 27, scope: !58)
!65 = !DILocation(line: 39, column: 34, scope: !58)
!66 = !DILocation(line: 40, column: 13, scope: !58)
!67 = !DILocation(line: 36, column: 35, scope: !54)
!68 = !DILocation(line: 36, column: 13, scope: !54)
!69 = distinct !{!69, !56, !70, !71}
!70 = !DILocation(line: 40, column: 13, scope: !51)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 43, column: 17, scope: !39)
!73 = !DILocation(line: 43, column: 9, scope: !39)
!74 = !DILocation(line: 44, column: 26, scope: !39)
!75 = !DILocation(line: 44, column: 9, scope: !39)
!76 = !DILocation(line: 45, column: 14, scope: !39)
!77 = !DILocation(line: 45, column: 9, scope: !39)
!78 = !DILocation(line: 47, column: 1, scope: !20)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_03_good", scope: !21, file: !21, line: 116, type: !22, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 118, column: 5, scope: !79)
!81 = !DILocation(line: 119, column: 5, scope: !79)
!82 = !DILocation(line: 120, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 132, type: !84, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!10, !10, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !21, line: 132, type: !10)
!90 = !DILocation(line: 132, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !21, line: 132, type: !86)
!92 = !DILocation(line: 132, column: 27, scope: !83)
!93 = !DILocation(line: 135, column: 22, scope: !83)
!94 = !DILocation(line: 135, column: 12, scope: !83)
!95 = !DILocation(line: 135, column: 5, scope: !83)
!96 = !DILocation(line: 137, column: 5, scope: !83)
!97 = !DILocation(line: 138, column: 5, scope: !83)
!98 = !DILocation(line: 139, column: 5, scope: !83)
!99 = !DILocation(line: 142, column: 5, scope: !83)
!100 = !DILocation(line: 143, column: 5, scope: !83)
!101 = !DILocation(line: 144, column: 5, scope: !83)
!102 = !DILocation(line: 146, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 54, type: !22, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !21, line: 56, type: !4)
!105 = !DILocation(line: 56, column: 21, scope: !103)
!106 = !DILocation(line: 57, column: 10, scope: !103)
!107 = !DILocation(line: 66, column: 33, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !21, line: 64, column: 5)
!109 = distinct !DILexicalBlock(scope: !103, file: !21, line: 58, column: 8)
!110 = !DILocation(line: 66, column: 16, scope: !108)
!111 = !DILocation(line: 66, column: 14, scope: !108)
!112 = !DILocation(line: 67, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !21, line: 67, column: 13)
!114 = !DILocation(line: 67, column: 18, scope: !113)
!115 = !DILocation(line: 67, column: 13, scope: !108)
!116 = !DILocation(line: 67, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !21, line: 67, column: 27)
!118 = !DILocalVariable(name: "source", scope: !119, file: !21, line: 70, type: !40)
!119 = distinct !DILexicalBlock(scope: !103, file: !21, line: 69, column: 5)
!120 = !DILocation(line: 70, column: 23, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !21, line: 72, type: !46)
!122 = distinct !DILexicalBlock(scope: !119, file: !21, line: 71, column: 9)
!123 = !DILocation(line: 72, column: 20, scope: !122)
!124 = !DILocation(line: 74, column: 20, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !21, line: 74, column: 13)
!126 = !DILocation(line: 74, column: 18, scope: !125)
!127 = !DILocation(line: 74, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !21, line: 74, column: 13)
!129 = !DILocation(line: 74, column: 27, scope: !128)
!130 = !DILocation(line: 74, column: 13, scope: !125)
!131 = !DILocation(line: 76, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !21, line: 75, column: 13)
!133 = !DILocation(line: 76, column: 17, scope: !132)
!134 = !DILocation(line: 76, column: 27, scope: !132)
!135 = !DILocation(line: 76, column: 34, scope: !132)
!136 = !DILocation(line: 77, column: 24, scope: !132)
!137 = !DILocation(line: 77, column: 17, scope: !132)
!138 = !DILocation(line: 77, column: 27, scope: !132)
!139 = !DILocation(line: 77, column: 34, scope: !132)
!140 = !DILocation(line: 78, column: 13, scope: !132)
!141 = !DILocation(line: 74, column: 35, scope: !128)
!142 = !DILocation(line: 74, column: 13, scope: !128)
!143 = distinct !{!143, !130, !144, !71}
!144 = !DILocation(line: 78, column: 13, scope: !125)
!145 = !DILocation(line: 81, column: 17, scope: !119)
!146 = !DILocation(line: 81, column: 9, scope: !119)
!147 = !DILocation(line: 82, column: 26, scope: !119)
!148 = !DILocation(line: 82, column: 9, scope: !119)
!149 = !DILocation(line: 83, column: 14, scope: !119)
!150 = !DILocation(line: 83, column: 9, scope: !119)
!151 = !DILocation(line: 85, column: 1, scope: !103)
!152 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 88, type: !22, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocalVariable(name: "data", scope: !152, file: !21, line: 90, type: !4)
!154 = !DILocation(line: 90, column: 21, scope: !152)
!155 = !DILocation(line: 91, column: 10, scope: !152)
!156 = !DILocation(line: 95, column: 33, scope: !157)
!157 = distinct !DILexicalBlock(scope: !158, file: !21, line: 93, column: 5)
!158 = distinct !DILexicalBlock(scope: !152, file: !21, line: 92, column: 8)
!159 = !DILocation(line: 95, column: 16, scope: !157)
!160 = !DILocation(line: 95, column: 14, scope: !157)
!161 = !DILocation(line: 96, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !21, line: 96, column: 13)
!163 = !DILocation(line: 96, column: 18, scope: !162)
!164 = !DILocation(line: 96, column: 13, scope: !157)
!165 = !DILocation(line: 96, column: 28, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !21, line: 96, column: 27)
!167 = !DILocalVariable(name: "source", scope: !168, file: !21, line: 99, type: !40)
!168 = distinct !DILexicalBlock(scope: !152, file: !21, line: 98, column: 5)
!169 = !DILocation(line: 99, column: 23, scope: !168)
!170 = !DILocalVariable(name: "i", scope: !171, file: !21, line: 101, type: !46)
!171 = distinct !DILexicalBlock(scope: !168, file: !21, line: 100, column: 9)
!172 = !DILocation(line: 101, column: 20, scope: !171)
!173 = !DILocation(line: 103, column: 20, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !21, line: 103, column: 13)
!175 = !DILocation(line: 103, column: 18, scope: !174)
!176 = !DILocation(line: 103, column: 25, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !21, line: 103, column: 13)
!178 = !DILocation(line: 103, column: 27, scope: !177)
!179 = !DILocation(line: 103, column: 13, scope: !174)
!180 = !DILocation(line: 105, column: 24, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !21, line: 104, column: 13)
!182 = !DILocation(line: 105, column: 17, scope: !181)
!183 = !DILocation(line: 105, column: 27, scope: !181)
!184 = !DILocation(line: 105, column: 34, scope: !181)
!185 = !DILocation(line: 106, column: 24, scope: !181)
!186 = !DILocation(line: 106, column: 17, scope: !181)
!187 = !DILocation(line: 106, column: 27, scope: !181)
!188 = !DILocation(line: 106, column: 34, scope: !181)
!189 = !DILocation(line: 107, column: 13, scope: !181)
!190 = !DILocation(line: 103, column: 35, scope: !177)
!191 = !DILocation(line: 103, column: 13, scope: !177)
!192 = distinct !{!192, !179, !193, !71}
!193 = !DILocation(line: 107, column: 13, scope: !174)
!194 = !DILocation(line: 110, column: 17, scope: !168)
!195 = !DILocation(line: 110, column: 9, scope: !168)
!196 = !DILocation(line: 111, column: 26, scope: !168)
!197 = !DILocation(line: 111, column: 9, scope: !168)
!198 = !DILocation(line: 112, column: 14, scope: !168)
!199 = !DILocation(line: 112, column: 9, scope: !168)
!200 = !DILocation(line: 114, column: 1, scope: !152)
