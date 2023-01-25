; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source1 = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  br label %source, !dbg !27

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !28), !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !31
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source1, metadata !39, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !54
  %cmp2 = icmp ult i64 %2, 100, !dbg !56
  br i1 %cmp2, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %3, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %4 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %4, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %5, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !74
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 0, !dbg !74
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !74
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !75
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !76
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !77
  call void @free(i8* %11) #6, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source1 = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !106
  br label %source, !dbg !107

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !108), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !110
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !111
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !112
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !113
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source1, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !128
  %cmp2 = icmp ult i64 %2, 100, !dbg !130
  br i1 %cmp2, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %3, !dbg !134
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !135
  store i32 0, i32* %intOne, align 8, !dbg !136
  %4 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %4, !dbg !138
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !139
  store i32 0, i32* %intTwo, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %5, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !146
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !147
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 0, !dbg !147
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !147
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !148
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !148
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !149
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !150
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !150
  call void @free(i8* %11) #6, !dbg !151
  ret void, !dbg !152
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 25, column: 5, scope: !20)
!28 = !DILabel(scope: !20, name: "source", file: !21, line: 26)
!29 = !DILocation(line: 26, column: 1, scope: !20)
!30 = !DILocation(line: 28, column: 29, scope: !20)
!31 = !DILocation(line: 28, column: 12, scope: !20)
!32 = !DILocation(line: 28, column: 10, scope: !20)
!33 = !DILocation(line: 29, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !20, file: !21, line: 29, column: 9)
!35 = !DILocation(line: 29, column: 14, scope: !34)
!36 = !DILocation(line: 29, column: 9, scope: !20)
!37 = !DILocation(line: 29, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !21, line: 29, column: 23)
!39 = !DILocalVariable(name: "source", scope: !40, file: !21, line: 31, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !21, line: 30, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 31, column: 23, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !46, file: !21, line: 33, type: !47)
!46 = distinct !DILexicalBlock(scope: !40, file: !21, line: 32, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 33, column: 20, scope: !46)
!51 = !DILocation(line: 35, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !21, line: 35, column: 13)
!53 = !DILocation(line: 35, column: 18, scope: !52)
!54 = !DILocation(line: 35, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !21, line: 35, column: 13)
!56 = !DILocation(line: 35, column: 27, scope: !55)
!57 = !DILocation(line: 35, column: 13, scope: !52)
!58 = !DILocation(line: 37, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !21, line: 36, column: 13)
!60 = !DILocation(line: 37, column: 17, scope: !59)
!61 = !DILocation(line: 37, column: 27, scope: !59)
!62 = !DILocation(line: 37, column: 34, scope: !59)
!63 = !DILocation(line: 38, column: 24, scope: !59)
!64 = !DILocation(line: 38, column: 17, scope: !59)
!65 = !DILocation(line: 38, column: 27, scope: !59)
!66 = !DILocation(line: 38, column: 34, scope: !59)
!67 = !DILocation(line: 39, column: 13, scope: !59)
!68 = !DILocation(line: 35, column: 35, scope: !55)
!69 = !DILocation(line: 35, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 39, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 42, column: 16, scope: !40)
!74 = !DILocation(line: 42, column: 9, scope: !40)
!75 = !DILocation(line: 43, column: 26, scope: !40)
!76 = !DILocation(line: 43, column: 9, scope: !40)
!77 = !DILocation(line: 44, column: 14, scope: !40)
!78 = !DILocation(line: 44, column: 9, scope: !40)
!79 = !DILocation(line: 46, column: 1, scope: !20)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_18_good", scope: !21, file: !21, line: 80, type: !22, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 82, column: 5, scope: !80)
!82 = !DILocation(line: 83, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 95, type: !84, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!10, !10, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !21, line: 95, type: !10)
!90 = !DILocation(line: 95, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !21, line: 95, type: !86)
!92 = !DILocation(line: 95, column: 27, scope: !83)
!93 = !DILocation(line: 98, column: 22, scope: !83)
!94 = !DILocation(line: 98, column: 12, scope: !83)
!95 = !DILocation(line: 98, column: 5, scope: !83)
!96 = !DILocation(line: 100, column: 5, scope: !83)
!97 = !DILocation(line: 101, column: 5, scope: !83)
!98 = !DILocation(line: 102, column: 5, scope: !83)
!99 = !DILocation(line: 105, column: 5, scope: !83)
!100 = !DILocation(line: 106, column: 5, scope: !83)
!101 = !DILocation(line: 107, column: 5, scope: !83)
!102 = !DILocation(line: 109, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 53, type: !22, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !21, line: 55, type: !4)
!105 = !DILocation(line: 55, column: 21, scope: !103)
!106 = !DILocation(line: 56, column: 10, scope: !103)
!107 = !DILocation(line: 57, column: 5, scope: !103)
!108 = !DILabel(scope: !103, name: "source", file: !21, line: 58)
!109 = !DILocation(line: 58, column: 1, scope: !103)
!110 = !DILocation(line: 60, column: 29, scope: !103)
!111 = !DILocation(line: 60, column: 12, scope: !103)
!112 = !DILocation(line: 60, column: 10, scope: !103)
!113 = !DILocation(line: 61, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !103, file: !21, line: 61, column: 9)
!115 = !DILocation(line: 61, column: 14, scope: !114)
!116 = !DILocation(line: 61, column: 9, scope: !103)
!117 = !DILocation(line: 61, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !21, line: 61, column: 23)
!119 = !DILocalVariable(name: "source", scope: !120, file: !21, line: 63, type: !41)
!120 = distinct !DILexicalBlock(scope: !103, file: !21, line: 62, column: 5)
!121 = !DILocation(line: 63, column: 23, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !123, file: !21, line: 65, type: !47)
!123 = distinct !DILexicalBlock(scope: !120, file: !21, line: 64, column: 9)
!124 = !DILocation(line: 65, column: 20, scope: !123)
!125 = !DILocation(line: 67, column: 20, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !21, line: 67, column: 13)
!127 = !DILocation(line: 67, column: 18, scope: !126)
!128 = !DILocation(line: 67, column: 25, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !21, line: 67, column: 13)
!130 = !DILocation(line: 67, column: 27, scope: !129)
!131 = !DILocation(line: 67, column: 13, scope: !126)
!132 = !DILocation(line: 69, column: 24, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !21, line: 68, column: 13)
!134 = !DILocation(line: 69, column: 17, scope: !133)
!135 = !DILocation(line: 69, column: 27, scope: !133)
!136 = !DILocation(line: 69, column: 34, scope: !133)
!137 = !DILocation(line: 70, column: 24, scope: !133)
!138 = !DILocation(line: 70, column: 17, scope: !133)
!139 = !DILocation(line: 70, column: 27, scope: !133)
!140 = !DILocation(line: 70, column: 34, scope: !133)
!141 = !DILocation(line: 71, column: 13, scope: !133)
!142 = !DILocation(line: 67, column: 35, scope: !129)
!143 = !DILocation(line: 67, column: 13, scope: !129)
!144 = distinct !{!144, !131, !145, !72}
!145 = !DILocation(line: 71, column: 13, scope: !126)
!146 = !DILocation(line: 74, column: 16, scope: !120)
!147 = !DILocation(line: 74, column: 9, scope: !120)
!148 = !DILocation(line: 75, column: 26, scope: !120)
!149 = !DILocation(line: 75, column: 9, scope: !120)
!150 = !DILocation(line: 76, column: 14, scope: !120)
!151 = !DILocation(line: 76, column: 9, scope: !120)
!152 = !DILocation(line: 78, column: 1, scope: !103)
