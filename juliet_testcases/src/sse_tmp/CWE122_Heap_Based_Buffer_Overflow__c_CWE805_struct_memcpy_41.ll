; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_badSink(%struct._twoIntsStruct* %data) #0 !dbg !20 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !47
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !48
  store i32 0, i32* %intOne, align 8, !dbg !49
  %2 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !51
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !52
  store i32 0, i32* %intTwo, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %3, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !60
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !61
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !61
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !61
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !62
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !63
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !64
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !64
  call void @free(i8* %9) #6, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_bad() #0 !dbg !67 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !73
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !74
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_badSink(%struct._twoIntsStruct* %2), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !85 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i64* %i, metadata !91, metadata !DIExpression()), !dbg !93
  store i64 0, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !97
  %cmp = icmp ult i64 %0, 100, !dbg !99
  br i1 %cmp, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !103
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !104
  store i32 0, i32* %intOne, align 8, !dbg !105
  %2 = load i64, i64* %i, align 8, !dbg !106
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !107
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !108
  store i32 0, i32* %intTwo, align 4, !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !111
  %inc = add i64 %3, 1, !dbg !111
  store i64 %inc, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !115
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !116
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !116
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !116
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !117
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !117
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !118
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !119
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !119
  call void @free(i8* %9) #6, !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_good() #0 !dbg !122 {
entry:
  call void @goodG2B(), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !125 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !131, metadata !DIExpression()), !dbg !132
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !133, metadata !DIExpression()), !dbg !134
  %call = call i64 @time(i64* null) #6, !dbg !135
  %conv = trunc i64 %call to i32, !dbg !136
  call void @srand(i32 %conv) #6, !dbg !137
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !138
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_good(), !dbg !139
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !140
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !141
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_bad(), !dbg !142
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !143
  ret i32 0, !dbg !144
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !145 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !146, metadata !DIExpression()), !dbg !147
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !148
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !149
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !150
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !151
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !154
  br i1 %cmp, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !156
  unreachable, !dbg !156

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !158
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_goodG2BSink(%struct._twoIntsStruct* %2), !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_badSink", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocalVariable(name: "data", arg: 1, scope: !20, file: !21, line: 21, type: !4)
!25 = !DILocation(line: 21, column: 91, scope: !20)
!26 = !DILocalVariable(name: "source", scope: !27, file: !21, line: 24, type: !28)
!27 = distinct !DILexicalBlock(scope: !20, file: !21, line: 23, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 24, column: 23, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !21, line: 26, type: !34)
!33 = distinct !DILexicalBlock(scope: !27, file: !21, line: 25, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 26, column: 20, scope: !33)
!38 = !DILocation(line: 28, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !21, line: 28, column: 13)
!40 = !DILocation(line: 28, column: 18, scope: !39)
!41 = !DILocation(line: 28, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !21, line: 28, column: 13)
!43 = !DILocation(line: 28, column: 27, scope: !42)
!44 = !DILocation(line: 28, column: 13, scope: !39)
!45 = !DILocation(line: 30, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !21, line: 29, column: 13)
!47 = !DILocation(line: 30, column: 17, scope: !46)
!48 = !DILocation(line: 30, column: 27, scope: !46)
!49 = !DILocation(line: 30, column: 34, scope: !46)
!50 = !DILocation(line: 31, column: 24, scope: !46)
!51 = !DILocation(line: 31, column: 17, scope: !46)
!52 = !DILocation(line: 31, column: 27, scope: !46)
!53 = !DILocation(line: 31, column: 34, scope: !46)
!54 = !DILocation(line: 32, column: 13, scope: !46)
!55 = !DILocation(line: 28, column: 35, scope: !42)
!56 = !DILocation(line: 28, column: 13, scope: !42)
!57 = distinct !{!57, !44, !58, !59}
!58 = !DILocation(line: 32, column: 13, scope: !39)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 35, column: 16, scope: !27)
!61 = !DILocation(line: 35, column: 9, scope: !27)
!62 = !DILocation(line: 36, column: 26, scope: !27)
!63 = !DILocation(line: 36, column: 9, scope: !27)
!64 = !DILocation(line: 37, column: 14, scope: !27)
!65 = !DILocation(line: 37, column: 9, scope: !27)
!66 = !DILocation(line: 39, column: 1, scope: !20)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_bad", scope: !21, file: !21, line: 41, type: !68, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{null}
!70 = !DILocalVariable(name: "data", scope: !67, file: !21, line: 43, type: !4)
!71 = !DILocation(line: 43, column: 21, scope: !67)
!72 = !DILocation(line: 44, column: 10, scope: !67)
!73 = !DILocation(line: 46, column: 29, scope: !67)
!74 = !DILocation(line: 46, column: 12, scope: !67)
!75 = !DILocation(line: 46, column: 10, scope: !67)
!76 = !DILocation(line: 47, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !67, file: !21, line: 47, column: 9)
!78 = !DILocation(line: 47, column: 14, scope: !77)
!79 = !DILocation(line: 47, column: 9, scope: !67)
!80 = !DILocation(line: 47, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !21, line: 47, column: 23)
!82 = !DILocation(line: 48, column: 74, scope: !67)
!83 = !DILocation(line: 48, column: 5, scope: !67)
!84 = !DILocation(line: 49, column: 1, scope: !67)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_goodG2BSink", scope: !21, file: !21, line: 55, type: !22, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", arg: 1, scope: !85, file: !21, line: 55, type: !4)
!87 = !DILocation(line: 55, column: 95, scope: !85)
!88 = !DILocalVariable(name: "source", scope: !89, file: !21, line: 58, type: !28)
!89 = distinct !DILexicalBlock(scope: !85, file: !21, line: 57, column: 5)
!90 = !DILocation(line: 58, column: 23, scope: !89)
!91 = !DILocalVariable(name: "i", scope: !92, file: !21, line: 60, type: !34)
!92 = distinct !DILexicalBlock(scope: !89, file: !21, line: 59, column: 9)
!93 = !DILocation(line: 60, column: 20, scope: !92)
!94 = !DILocation(line: 62, column: 20, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !21, line: 62, column: 13)
!96 = !DILocation(line: 62, column: 18, scope: !95)
!97 = !DILocation(line: 62, column: 25, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !21, line: 62, column: 13)
!99 = !DILocation(line: 62, column: 27, scope: !98)
!100 = !DILocation(line: 62, column: 13, scope: !95)
!101 = !DILocation(line: 64, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !21, line: 63, column: 13)
!103 = !DILocation(line: 64, column: 17, scope: !102)
!104 = !DILocation(line: 64, column: 27, scope: !102)
!105 = !DILocation(line: 64, column: 34, scope: !102)
!106 = !DILocation(line: 65, column: 24, scope: !102)
!107 = !DILocation(line: 65, column: 17, scope: !102)
!108 = !DILocation(line: 65, column: 27, scope: !102)
!109 = !DILocation(line: 65, column: 34, scope: !102)
!110 = !DILocation(line: 66, column: 13, scope: !102)
!111 = !DILocation(line: 62, column: 35, scope: !98)
!112 = !DILocation(line: 62, column: 13, scope: !98)
!113 = distinct !{!113, !100, !114, !59}
!114 = !DILocation(line: 66, column: 13, scope: !95)
!115 = !DILocation(line: 69, column: 16, scope: !89)
!116 = !DILocation(line: 69, column: 9, scope: !89)
!117 = !DILocation(line: 70, column: 26, scope: !89)
!118 = !DILocation(line: 70, column: 9, scope: !89)
!119 = !DILocation(line: 71, column: 14, scope: !89)
!120 = !DILocation(line: 71, column: 9, scope: !89)
!121 = !DILocation(line: 73, column: 1, scope: !85)
!122 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_good", scope: !21, file: !21, line: 86, type: !68, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DILocation(line: 88, column: 5, scope: !122)
!124 = !DILocation(line: 89, column: 1, scope: !122)
!125 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 101, type: !126, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DISubroutineType(types: !127)
!127 = !{!10, !10, !128}
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!131 = !DILocalVariable(name: "argc", arg: 1, scope: !125, file: !21, line: 101, type: !10)
!132 = !DILocation(line: 101, column: 14, scope: !125)
!133 = !DILocalVariable(name: "argv", arg: 2, scope: !125, file: !21, line: 101, type: !128)
!134 = !DILocation(line: 101, column: 27, scope: !125)
!135 = !DILocation(line: 104, column: 22, scope: !125)
!136 = !DILocation(line: 104, column: 12, scope: !125)
!137 = !DILocation(line: 104, column: 5, scope: !125)
!138 = !DILocation(line: 106, column: 5, scope: !125)
!139 = !DILocation(line: 107, column: 5, scope: !125)
!140 = !DILocation(line: 108, column: 5, scope: !125)
!141 = !DILocation(line: 111, column: 5, scope: !125)
!142 = !DILocation(line: 112, column: 5, scope: !125)
!143 = !DILocation(line: 113, column: 5, scope: !125)
!144 = !DILocation(line: 115, column: 5, scope: !125)
!145 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 76, type: !68, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !21, line: 78, type: !4)
!147 = !DILocation(line: 78, column: 21, scope: !145)
!148 = !DILocation(line: 79, column: 10, scope: !145)
!149 = !DILocation(line: 81, column: 29, scope: !145)
!150 = !DILocation(line: 81, column: 12, scope: !145)
!151 = !DILocation(line: 81, column: 10, scope: !145)
!152 = !DILocation(line: 82, column: 9, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !21, line: 82, column: 9)
!154 = !DILocation(line: 82, column: 14, scope: !153)
!155 = !DILocation(line: 82, column: 9, scope: !145)
!156 = !DILocation(line: 82, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !21, line: 82, column: 23)
!158 = !DILocation(line: 83, column: 78, scope: !145)
!159 = !DILocation(line: 83, column: 5, scope: !145)
!160 = !DILocation(line: 84, column: 1, scope: !145)
