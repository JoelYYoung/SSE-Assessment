; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !36
  br i1 %cmp, label %if.then2, label %if.end, !dbg !37

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !40

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !41
  %2 = bitcast i8* %call3 to %struct._twoIntsStruct*, !dbg !43
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !45
  %cmp4 = icmp eq %struct._twoIntsStruct* %3, null, !dbg !47
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !48

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !49
  unreachable, !dbg !49

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i, metadata !57, metadata !DIExpression()), !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end7
  %4 = load i64, i64* %i, align 8, !dbg !66
  %cmp8 = icmp ult i64 %4, 100, !dbg !68
  br i1 %cmp8, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !72
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !73
  store i32 0, i32* %intOne, align 8, !dbg !74
  %6 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !76
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx9, i32 0, i32 1, !dbg !77
  store i32 0, i32* %intTwo, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %7, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !85
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !86
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !86
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !86
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !87
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !87
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx10), !dbg !88
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !89
  call void @free(i8* %13) #6, !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12_good() #0 !dbg !92 {
entry:
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #6, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #6, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !118
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !119
  %tobool = icmp ne i32 %call, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !122
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !124
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !126
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !128
  br i1 %cmp, label %if.then2, label %if.end, !dbg !129

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !132

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !133
  %2 = bitcast i8* %call3 to %struct._twoIntsStruct*, !dbg !135
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data, align 8, !dbg !136
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !137
  %cmp4 = icmp eq %struct._twoIntsStruct* %3, null, !dbg !139
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !140

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !141
  unreachable, !dbg !141

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end7
  %4 = load i64, i64* %i, align 8, !dbg !152
  %cmp8 = icmp ult i64 %4, 100, !dbg !154
  br i1 %cmp8, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !158
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !159
  store i32 0, i32* %intOne, align 8, !dbg !160
  %6 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !162
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx9, i32 0, i32 1, !dbg !163
  store i32 0, i32* %intTwo, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %7, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !170
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !171
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !171
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !171
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !171
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !172
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !172
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx10), !dbg !173
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !174
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !174
  call void @free(i8* %13) #6, !dbg !175
  ret void, !dbg !176
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 25, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 25, column: 8)
!29 = !DILocation(line: 25, column: 8, scope: !20)
!30 = !DILocation(line: 28, column: 33, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !21, line: 26, column: 5)
!32 = !DILocation(line: 28, column: 16, scope: !31)
!33 = !DILocation(line: 28, column: 14, scope: !31)
!34 = !DILocation(line: 29, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 29, column: 13)
!36 = !DILocation(line: 29, column: 18, scope: !35)
!37 = !DILocation(line: 29, column: 13, scope: !31)
!38 = !DILocation(line: 29, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !21, line: 29, column: 27)
!40 = !DILocation(line: 30, column: 5, scope: !31)
!41 = !DILocation(line: 34, column: 33, scope: !42)
!42 = distinct !DILexicalBlock(scope: !28, file: !21, line: 32, column: 5)
!43 = !DILocation(line: 34, column: 16, scope: !42)
!44 = !DILocation(line: 34, column: 14, scope: !42)
!45 = !DILocation(line: 35, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !21, line: 35, column: 13)
!47 = !DILocation(line: 35, column: 18, scope: !46)
!48 = !DILocation(line: 35, column: 13, scope: !42)
!49 = !DILocation(line: 35, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !21, line: 35, column: 27)
!51 = !DILocalVariable(name: "source", scope: !52, file: !21, line: 38, type: !53)
!52 = distinct !DILexicalBlock(scope: !20, file: !21, line: 37, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 38, column: 23, scope: !52)
!57 = !DILocalVariable(name: "i", scope: !58, file: !21, line: 40, type: !59)
!58 = distinct !DILexicalBlock(scope: !52, file: !21, line: 39, column: 9)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !60, line: 46, baseType: !61)
!60 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!61 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 40, column: 20, scope: !58)
!63 = !DILocation(line: 42, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !21, line: 42, column: 13)
!65 = !DILocation(line: 42, column: 18, scope: !64)
!66 = !DILocation(line: 42, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !21, line: 42, column: 13)
!68 = !DILocation(line: 42, column: 27, scope: !67)
!69 = !DILocation(line: 42, column: 13, scope: !64)
!70 = !DILocation(line: 44, column: 24, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !21, line: 43, column: 13)
!72 = !DILocation(line: 44, column: 17, scope: !71)
!73 = !DILocation(line: 44, column: 27, scope: !71)
!74 = !DILocation(line: 44, column: 34, scope: !71)
!75 = !DILocation(line: 45, column: 24, scope: !71)
!76 = !DILocation(line: 45, column: 17, scope: !71)
!77 = !DILocation(line: 45, column: 27, scope: !71)
!78 = !DILocation(line: 45, column: 34, scope: !71)
!79 = !DILocation(line: 46, column: 13, scope: !71)
!80 = !DILocation(line: 42, column: 35, scope: !67)
!81 = !DILocation(line: 42, column: 13, scope: !67)
!82 = distinct !{!82, !69, !83, !84}
!83 = !DILocation(line: 46, column: 13, scope: !64)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 49, column: 17, scope: !52)
!86 = !DILocation(line: 49, column: 9, scope: !52)
!87 = !DILocation(line: 50, column: 26, scope: !52)
!88 = !DILocation(line: 50, column: 9, scope: !52)
!89 = !DILocation(line: 51, column: 14, scope: !52)
!90 = !DILocation(line: 51, column: 9, scope: !52)
!91 = !DILocation(line: 53, column: 1, scope: !20)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_12_good", scope: !21, file: !21, line: 95, type: !22, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 97, column: 5, scope: !92)
!94 = !DILocation(line: 98, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 110, type: !96, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!10, !10, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !21, line: 110, type: !10)
!102 = !DILocation(line: 110, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !21, line: 110, type: !98)
!104 = !DILocation(line: 110, column: 27, scope: !95)
!105 = !DILocation(line: 113, column: 22, scope: !95)
!106 = !DILocation(line: 113, column: 12, scope: !95)
!107 = !DILocation(line: 113, column: 5, scope: !95)
!108 = !DILocation(line: 115, column: 5, scope: !95)
!109 = !DILocation(line: 116, column: 5, scope: !95)
!110 = !DILocation(line: 117, column: 5, scope: !95)
!111 = !DILocation(line: 120, column: 5, scope: !95)
!112 = !DILocation(line: 121, column: 5, scope: !95)
!113 = !DILocation(line: 122, column: 5, scope: !95)
!114 = !DILocation(line: 124, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !21, line: 63, type: !4)
!117 = !DILocation(line: 63, column: 21, scope: !115)
!118 = !DILocation(line: 64, column: 10, scope: !115)
!119 = !DILocation(line: 65, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !21, line: 65, column: 8)
!121 = !DILocation(line: 65, column: 8, scope: !115)
!122 = !DILocation(line: 68, column: 33, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !21, line: 66, column: 5)
!124 = !DILocation(line: 68, column: 16, scope: !123)
!125 = !DILocation(line: 68, column: 14, scope: !123)
!126 = !DILocation(line: 69, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !21, line: 69, column: 13)
!128 = !DILocation(line: 69, column: 18, scope: !127)
!129 = !DILocation(line: 69, column: 13, scope: !123)
!130 = !DILocation(line: 69, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !21, line: 69, column: 27)
!132 = !DILocation(line: 70, column: 5, scope: !123)
!133 = !DILocation(line: 74, column: 33, scope: !134)
!134 = distinct !DILexicalBlock(scope: !120, file: !21, line: 72, column: 5)
!135 = !DILocation(line: 74, column: 16, scope: !134)
!136 = !DILocation(line: 74, column: 14, scope: !134)
!137 = !DILocation(line: 75, column: 13, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !21, line: 75, column: 13)
!139 = !DILocation(line: 75, column: 18, scope: !138)
!140 = !DILocation(line: 75, column: 13, scope: !134)
!141 = !DILocation(line: 75, column: 28, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !21, line: 75, column: 27)
!143 = !DILocalVariable(name: "source", scope: !144, file: !21, line: 78, type: !53)
!144 = distinct !DILexicalBlock(scope: !115, file: !21, line: 77, column: 5)
!145 = !DILocation(line: 78, column: 23, scope: !144)
!146 = !DILocalVariable(name: "i", scope: !147, file: !21, line: 80, type: !59)
!147 = distinct !DILexicalBlock(scope: !144, file: !21, line: 79, column: 9)
!148 = !DILocation(line: 80, column: 20, scope: !147)
!149 = !DILocation(line: 82, column: 20, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !21, line: 82, column: 13)
!151 = !DILocation(line: 82, column: 18, scope: !150)
!152 = !DILocation(line: 82, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !21, line: 82, column: 13)
!154 = !DILocation(line: 82, column: 27, scope: !153)
!155 = !DILocation(line: 82, column: 13, scope: !150)
!156 = !DILocation(line: 84, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !21, line: 83, column: 13)
!158 = !DILocation(line: 84, column: 17, scope: !157)
!159 = !DILocation(line: 84, column: 27, scope: !157)
!160 = !DILocation(line: 84, column: 34, scope: !157)
!161 = !DILocation(line: 85, column: 24, scope: !157)
!162 = !DILocation(line: 85, column: 17, scope: !157)
!163 = !DILocation(line: 85, column: 27, scope: !157)
!164 = !DILocation(line: 85, column: 34, scope: !157)
!165 = !DILocation(line: 86, column: 13, scope: !157)
!166 = !DILocation(line: 82, column: 35, scope: !153)
!167 = !DILocation(line: 82, column: 13, scope: !153)
!168 = distinct !{!168, !155, !169, !84}
!169 = !DILocation(line: 86, column: 13, scope: !150)
!170 = !DILocation(line: 89, column: 17, scope: !144)
!171 = !DILocation(line: 89, column: 9, scope: !144)
!172 = !DILocation(line: 90, column: 26, scope: !144)
!173 = !DILocation(line: 90, column: 9, scope: !144)
!174 = !DILocation(line: 91, column: 14, scope: !144)
!175 = !DILocation(line: 91, column: 9, scope: !144)
!176 = !DILocation(line: 93, column: 1, scope: !115)
