; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !17

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_bad() #0 !dbg !26 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !32
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_badData, align 8, !dbg !42
  call void @badSink(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !68 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_badData, align 8, !dbg !71
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !72, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %i, metadata !78, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !87
  %cmp = icmp ult i64 %1, 100, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !93
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !94
  store i32 0, i32* %intOne, align 8, !dbg !95
  %3 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !97
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !98
  store i32 0, i32* %intTwo, align 4, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !101
  %inc = add i64 %4, 1, !dbg !101
  store i64 %inc, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !106
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !107
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !107
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !107
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !107
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !108
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !109
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !110
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !110
  call void @free(i8* %10) #6, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !116
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !117
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !118
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !119
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !120
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !126
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_goodG2BData, align 8, !dbg !127
  call void @goodG2BSink(), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !130 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_goodG2BData, align 8, !dbg !133
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !143
  %cmp = icmp ult i64 %1, 100, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !149
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !150
  store i32 0, i32* %intOne, align 8, !dbg !151
  %3 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !153
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !154
  store i32 0, i32* %intTwo, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %4, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !161
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !162
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !162
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !162
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !162
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !163
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !163
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !164
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !165
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !165
  call void @free(i8* %10) #6, !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_badData", scope: !2, file: !19, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14, !15}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !{!0, !17}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_goodG2BData", scope: !2, file: !19, line: 20, type: !6, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45.c", directory: "/root/SSE-Assessment")
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"clang version 13.0.0"}
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_bad", scope: !19, file: !19, line: 45, type: !27, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DILocalVariable(name: "data", scope: !26, file: !19, line: 47, type: !6)
!30 = !DILocation(line: 47, column: 21, scope: !26)
!31 = !DILocation(line: 48, column: 10, scope: !26)
!32 = !DILocation(line: 50, column: 29, scope: !26)
!33 = !DILocation(line: 50, column: 12, scope: !26)
!34 = !DILocation(line: 50, column: 10, scope: !26)
!35 = !DILocation(line: 51, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !26, file: !19, line: 51, column: 9)
!37 = !DILocation(line: 51, column: 14, scope: !36)
!38 = !DILocation(line: 51, column: 9, scope: !26)
!39 = !DILocation(line: 51, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 51, column: 23)
!41 = !DILocation(line: 52, column: 77, scope: !26)
!42 = !DILocation(line: 52, column: 75, scope: !26)
!43 = !DILocation(line: 53, column: 5, scope: !26)
!44 = !DILocation(line: 54, column: 1, scope: !26)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_45_good", scope: !19, file: !19, line: 93, type: !27, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DILocation(line: 95, column: 5, scope: !45)
!47 = !DILocation(line: 96, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 107, type: !49, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DISubroutineType(types: !50)
!50 = !{!12, !12, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !19, line: 107, type: !12)
!55 = !DILocation(line: 107, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !19, line: 107, type: !51)
!57 = !DILocation(line: 107, column: 27, scope: !48)
!58 = !DILocation(line: 110, column: 22, scope: !48)
!59 = !DILocation(line: 110, column: 12, scope: !48)
!60 = !DILocation(line: 110, column: 5, scope: !48)
!61 = !DILocation(line: 112, column: 5, scope: !48)
!62 = !DILocation(line: 113, column: 5, scope: !48)
!63 = !DILocation(line: 114, column: 5, scope: !48)
!64 = !DILocation(line: 117, column: 5, scope: !48)
!65 = !DILocation(line: 118, column: 5, scope: !48)
!66 = !DILocation(line: 119, column: 5, scope: !48)
!67 = !DILocation(line: 121, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 24, type: !27, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocalVariable(name: "data", scope: !68, file: !19, line: 26, type: !6)
!70 = !DILocation(line: 26, column: 21, scope: !68)
!71 = !DILocation(line: 26, column: 28, scope: !68)
!72 = !DILocalVariable(name: "source", scope: !73, file: !19, line: 28, type: !74)
!73 = distinct !DILexicalBlock(scope: !68, file: !19, line: 27, column: 5)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 100)
!77 = !DILocation(line: 28, column: 23, scope: !73)
!78 = !DILocalVariable(name: "i", scope: !79, file: !19, line: 30, type: !80)
!79 = distinct !DILexicalBlock(scope: !73, file: !19, line: 29, column: 9)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !81, line: 46, baseType: !82)
!81 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!82 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!83 = !DILocation(line: 30, column: 20, scope: !79)
!84 = !DILocation(line: 32, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !19, line: 32, column: 13)
!86 = !DILocation(line: 32, column: 18, scope: !85)
!87 = !DILocation(line: 32, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !19, line: 32, column: 13)
!89 = !DILocation(line: 32, column: 27, scope: !88)
!90 = !DILocation(line: 32, column: 13, scope: !85)
!91 = !DILocation(line: 34, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !19, line: 33, column: 13)
!93 = !DILocation(line: 34, column: 17, scope: !92)
!94 = !DILocation(line: 34, column: 27, scope: !92)
!95 = !DILocation(line: 34, column: 34, scope: !92)
!96 = !DILocation(line: 35, column: 24, scope: !92)
!97 = !DILocation(line: 35, column: 17, scope: !92)
!98 = !DILocation(line: 35, column: 27, scope: !92)
!99 = !DILocation(line: 35, column: 34, scope: !92)
!100 = !DILocation(line: 36, column: 13, scope: !92)
!101 = !DILocation(line: 32, column: 35, scope: !88)
!102 = !DILocation(line: 32, column: 13, scope: !88)
!103 = distinct !{!103, !90, !104, !105}
!104 = !DILocation(line: 36, column: 13, scope: !85)
!105 = !{!"llvm.loop.mustprogress"}
!106 = !DILocation(line: 39, column: 17, scope: !73)
!107 = !DILocation(line: 39, column: 9, scope: !73)
!108 = !DILocation(line: 40, column: 26, scope: !73)
!109 = !DILocation(line: 40, column: 9, scope: !73)
!110 = !DILocation(line: 41, column: 14, scope: !73)
!111 = !DILocation(line: 41, column: 9, scope: !73)
!112 = !DILocation(line: 43, column: 1, scope: !68)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 82, type: !27, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocalVariable(name: "data", scope: !113, file: !19, line: 84, type: !6)
!115 = !DILocation(line: 84, column: 21, scope: !113)
!116 = !DILocation(line: 85, column: 10, scope: !113)
!117 = !DILocation(line: 87, column: 29, scope: !113)
!118 = !DILocation(line: 87, column: 12, scope: !113)
!119 = !DILocation(line: 87, column: 10, scope: !113)
!120 = !DILocation(line: 88, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !19, line: 88, column: 9)
!122 = !DILocation(line: 88, column: 14, scope: !121)
!123 = !DILocation(line: 88, column: 9, scope: !113)
!124 = !DILocation(line: 88, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !19, line: 88, column: 23)
!126 = !DILocation(line: 89, column: 81, scope: !113)
!127 = !DILocation(line: 89, column: 79, scope: !113)
!128 = !DILocation(line: 90, column: 5, scope: !113)
!129 = !DILocation(line: 91, column: 1, scope: !113)
!130 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 61, type: !27, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!131 = !DILocalVariable(name: "data", scope: !130, file: !19, line: 63, type: !6)
!132 = !DILocation(line: 63, column: 21, scope: !130)
!133 = !DILocation(line: 63, column: 28, scope: !130)
!134 = !DILocalVariable(name: "source", scope: !135, file: !19, line: 65, type: !74)
!135 = distinct !DILexicalBlock(scope: !130, file: !19, line: 64, column: 5)
!136 = !DILocation(line: 65, column: 23, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !138, file: !19, line: 67, type: !80)
!138 = distinct !DILexicalBlock(scope: !135, file: !19, line: 66, column: 9)
!139 = !DILocation(line: 67, column: 20, scope: !138)
!140 = !DILocation(line: 69, column: 20, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !19, line: 69, column: 13)
!142 = !DILocation(line: 69, column: 18, scope: !141)
!143 = !DILocation(line: 69, column: 25, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !19, line: 69, column: 13)
!145 = !DILocation(line: 69, column: 27, scope: !144)
!146 = !DILocation(line: 69, column: 13, scope: !141)
!147 = !DILocation(line: 71, column: 24, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !19, line: 70, column: 13)
!149 = !DILocation(line: 71, column: 17, scope: !148)
!150 = !DILocation(line: 71, column: 27, scope: !148)
!151 = !DILocation(line: 71, column: 34, scope: !148)
!152 = !DILocation(line: 72, column: 24, scope: !148)
!153 = !DILocation(line: 72, column: 17, scope: !148)
!154 = !DILocation(line: 72, column: 27, scope: !148)
!155 = !DILocation(line: 72, column: 34, scope: !148)
!156 = !DILocation(line: 73, column: 13, scope: !148)
!157 = !DILocation(line: 69, column: 35, scope: !144)
!158 = !DILocation(line: 69, column: 13, scope: !144)
!159 = distinct !{!159, !146, !160, !105}
!160 = !DILocation(line: 73, column: 13, scope: !141)
!161 = !DILocation(line: 76, column: 17, scope: !135)
!162 = !DILocation(line: 76, column: 9, scope: !135)
!163 = !DILocation(line: 77, column: 26, scope: !135)
!164 = !DILocation(line: 77, column: 9, scope: !135)
!165 = !DILocation(line: 78, column: 14, scope: !135)
!166 = !DILocation(line: 78, column: 9, scope: !135)
!167 = !DILocation(line: 80, column: 1, scope: !130)
