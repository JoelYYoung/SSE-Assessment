; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !17
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !20

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_bad() #0 !dbg !28 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !31, metadata !DIExpression()), !dbg !32
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !33
  store i32 1, i32* @badStatic, align 4, !dbg !34
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %call = call %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %0), !dbg !36
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  call void @printStructLine(%struct._twoIntsStruct* %1), !dbg !39
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !40
  call void @free(i8* %3) #5, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @badSource(%struct._twoIntsStruct* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i32, i32* @badStatic, align 4, !dbg !48
  %tobool = icmp ne i32 %0, 0, !dbg !48
  br i1 %tobool, label %if.then, label %if.end2, !dbg !50

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !51
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !53
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !54
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !55
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !57
  br i1 %cmp, label %if.then1, label %if.end, !dbg !58

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !59
  unreachable, !dbg !59

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !61
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !62
  store i32 1, i32* %intOne, align 4, !dbg !63
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !65
  store i32 2, i32* %intTwo, align 4, !dbg !66
  br label %if.end2, !dbg !67

if.end2:                                          ; preds = %if.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !68
  ret %struct._twoIntsStruct* %5, !dbg !69
}

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !97
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !98
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !99
  %call = call %struct._twoIntsStruct* @goodG2B1Source(%struct._twoIntsStruct* %0), !dbg !100
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !101
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !102
  call void @printStructLine(%struct._twoIntsStruct* %1), !dbg !103
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !104
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !104
  call void @free(i8* %3) #5, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @goodG2B1Source(%struct._twoIntsStruct* %data) #0 !dbg !107 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !110
  %tobool = icmp ne i32 %0, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end2, !dbg !115

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !116
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !118
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !119
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !120
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !122
  br i1 %cmp, label %if.then1, label %if.end, !dbg !123

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %if.else
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !126
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !127
  store i32 1, i32* %intOne, align 4, !dbg !128
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !129
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !130
  store i32 2, i32* %intTwo, align 4, !dbg !131
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !132
  ret %struct._twoIntsStruct* %5, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !135, metadata !DIExpression()), !dbg !136
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !137
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !138
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %call = call %struct._twoIntsStruct* @goodG2B2Source(%struct._twoIntsStruct* %0), !dbg !140
  store %struct._twoIntsStruct* %call, %struct._twoIntsStruct** %data, align 8, !dbg !141
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  call void @printStructLine(%struct._twoIntsStruct* %1), !dbg !143
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !144
  call void @free(i8* %3) #5, !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal %struct._twoIntsStruct* @goodG2B2Source(%struct._twoIntsStruct* %data) #0 !dbg !147 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !150
  %tobool = icmp ne i32 %0, 0, !dbg !150
  br i1 %tobool, label %if.then, label %if.end2, !dbg !152

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !153
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !155
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data.addr, align 8, !dbg !156
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !157
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !159
  br i1 %cmp, label %if.then1, label %if.end, !dbg !160

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !161
  unreachable, !dbg !161

if.end:                                           ; preds = %if.then
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !163
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i32 0, i32 0, !dbg !164
  store i32 1, i32* %intOne, align 4, !dbg !165
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !166
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i32 0, i32 1, !dbg !167
  store i32 2, i32* %intTwo, align 4, !dbg !168
  br label %if.end2, !dbg !169

if.end2:                                          ; preds = %if.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !170
  ret %struct._twoIntsStruct* %5, !dbg !171
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !19, line: 22, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !16, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !15}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !9, line: 100, baseType: !10)
!9 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !9, line: 96, size: 64, elements: !11)
!11 = !{!12, !14}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !10, file: !9, line: 98, baseType: !13, size: 32)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !10, file: !9, line: 99, baseType: !13, size: 32, offset: 32)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !{!0, !17, !20}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !19, line: 55, type: !13, isLocal: true, isDefinition: true)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21.c", directory: "/root/SSE-Assessment")
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !19, line: 56, type: !13, isLocal: true, isDefinition: true)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"clang version 13.0.0"}
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_bad", scope: !19, file: !19, line: 38, type: !29, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!29 = !DISubroutineType(types: !30)
!30 = !{null}
!31 = !DILocalVariable(name: "data", scope: !28, file: !19, line: 40, type: !7)
!32 = !DILocation(line: 40, column: 21, scope: !28)
!33 = !DILocation(line: 42, column: 10, scope: !28)
!34 = !DILocation(line: 43, column: 15, scope: !28)
!35 = !DILocation(line: 44, column: 22, scope: !28)
!36 = !DILocation(line: 44, column: 12, scope: !28)
!37 = !DILocation(line: 44, column: 10, scope: !28)
!38 = !DILocation(line: 46, column: 21, scope: !28)
!39 = !DILocation(line: 46, column: 5, scope: !28)
!40 = !DILocation(line: 47, column: 10, scope: !28)
!41 = !DILocation(line: 47, column: 5, scope: !28)
!42 = !DILocation(line: 48, column: 1, scope: !28)
!43 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 24, type: !44, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!7, !7}
!46 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !19, line: 24, type: !7)
!47 = !DILocation(line: 24, column: 50, scope: !43)
!48 = !DILocation(line: 26, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !19, line: 26, column: 8)
!50 = !DILocation(line: 26, column: 8, scope: !43)
!51 = !DILocation(line: 30, column: 33, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !19, line: 27, column: 5)
!53 = !DILocation(line: 30, column: 16, scope: !52)
!54 = !DILocation(line: 30, column: 14, scope: !52)
!55 = !DILocation(line: 31, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !19, line: 31, column: 13)
!57 = !DILocation(line: 31, column: 18, scope: !56)
!58 = !DILocation(line: 31, column: 13, scope: !52)
!59 = !DILocation(line: 31, column: 28, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !19, line: 31, column: 27)
!61 = !DILocation(line: 32, column: 9, scope: !52)
!62 = !DILocation(line: 32, column: 15, scope: !52)
!63 = !DILocation(line: 32, column: 22, scope: !52)
!64 = !DILocation(line: 33, column: 9, scope: !52)
!65 = !DILocation(line: 33, column: 15, scope: !52)
!66 = !DILocation(line: 33, column: 22, scope: !52)
!67 = !DILocation(line: 34, column: 5, scope: !52)
!68 = !DILocation(line: 35, column: 12, scope: !43)
!69 = !DILocation(line: 35, column: 5, scope: !43)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_struct_21_good", scope: !19, file: !19, line: 115, type: !29, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 117, column: 5, scope: !70)
!72 = !DILocation(line: 118, column: 5, scope: !70)
!73 = !DILocation(line: 119, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 131, type: !75, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!13, !13, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !19, line: 131, type: !13)
!81 = !DILocation(line: 131, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !19, line: 131, type: !77)
!83 = !DILocation(line: 131, column: 27, scope: !74)
!84 = !DILocation(line: 134, column: 22, scope: !74)
!85 = !DILocation(line: 134, column: 12, scope: !74)
!86 = !DILocation(line: 134, column: 5, scope: !74)
!87 = !DILocation(line: 136, column: 5, scope: !74)
!88 = !DILocation(line: 137, column: 5, scope: !74)
!89 = !DILocation(line: 138, column: 5, scope: !74)
!90 = !DILocation(line: 141, column: 5, scope: !74)
!91 = !DILocation(line: 142, column: 5, scope: !74)
!92 = !DILocation(line: 143, column: 5, scope: !74)
!93 = !DILocation(line: 145, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 77, type: !29, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !19, line: 79, type: !7)
!96 = !DILocation(line: 79, column: 21, scope: !94)
!97 = !DILocation(line: 81, column: 10, scope: !94)
!98 = !DILocation(line: 82, column: 20, scope: !94)
!99 = !DILocation(line: 83, column: 27, scope: !94)
!100 = !DILocation(line: 83, column: 12, scope: !94)
!101 = !DILocation(line: 83, column: 10, scope: !94)
!102 = !DILocation(line: 85, column: 21, scope: !94)
!103 = !DILocation(line: 85, column: 5, scope: !94)
!104 = !DILocation(line: 86, column: 10, scope: !94)
!105 = !DILocation(line: 86, column: 5, scope: !94)
!106 = !DILocation(line: 87, column: 1, scope: !94)
!107 = distinct !DISubprogram(name: "goodG2B1Source", scope: !19, file: !19, line: 59, type: !44, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", arg: 1, scope: !107, file: !19, line: 59, type: !7)
!109 = !DILocation(line: 59, column: 55, scope: !107)
!110 = !DILocation(line: 61, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !19, line: 61, column: 8)
!112 = !DILocation(line: 61, column: 8, scope: !107)
!113 = !DILocation(line: 64, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !19, line: 62, column: 5)
!115 = !DILocation(line: 65, column: 5, scope: !114)
!116 = !DILocation(line: 69, column: 33, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !19, line: 67, column: 5)
!118 = !DILocation(line: 69, column: 16, scope: !117)
!119 = !DILocation(line: 69, column: 14, scope: !117)
!120 = !DILocation(line: 70, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !19, line: 70, column: 13)
!122 = !DILocation(line: 70, column: 18, scope: !121)
!123 = !DILocation(line: 70, column: 13, scope: !117)
!124 = !DILocation(line: 70, column: 28, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !19, line: 70, column: 27)
!126 = !DILocation(line: 71, column: 9, scope: !117)
!127 = !DILocation(line: 71, column: 15, scope: !117)
!128 = !DILocation(line: 71, column: 22, scope: !117)
!129 = !DILocation(line: 72, column: 9, scope: !117)
!130 = !DILocation(line: 72, column: 15, scope: !117)
!131 = !DILocation(line: 72, column: 22, scope: !117)
!132 = !DILocation(line: 74, column: 12, scope: !107)
!133 = !DILocation(line: 74, column: 5, scope: !107)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 103, type: !29, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!135 = !DILocalVariable(name: "data", scope: !134, file: !19, line: 105, type: !7)
!136 = !DILocation(line: 105, column: 21, scope: !134)
!137 = !DILocation(line: 107, column: 10, scope: !134)
!138 = !DILocation(line: 108, column: 20, scope: !134)
!139 = !DILocation(line: 109, column: 27, scope: !134)
!140 = !DILocation(line: 109, column: 12, scope: !134)
!141 = !DILocation(line: 109, column: 10, scope: !134)
!142 = !DILocation(line: 111, column: 21, scope: !134)
!143 = !DILocation(line: 111, column: 5, scope: !134)
!144 = !DILocation(line: 112, column: 10, scope: !134)
!145 = !DILocation(line: 112, column: 5, scope: !134)
!146 = !DILocation(line: 113, column: 1, scope: !134)
!147 = distinct !DISubprogram(name: "goodG2B2Source", scope: !19, file: !19, line: 90, type: !44, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!148 = !DILocalVariable(name: "data", arg: 1, scope: !147, file: !19, line: 90, type: !7)
!149 = !DILocation(line: 90, column: 55, scope: !147)
!150 = !DILocation(line: 92, column: 8, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !19, line: 92, column: 8)
!152 = !DILocation(line: 92, column: 8, scope: !147)
!153 = !DILocation(line: 95, column: 33, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !19, line: 93, column: 5)
!155 = !DILocation(line: 95, column: 16, scope: !154)
!156 = !DILocation(line: 95, column: 14, scope: !154)
!157 = !DILocation(line: 96, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !19, line: 96, column: 13)
!159 = !DILocation(line: 96, column: 18, scope: !158)
!160 = !DILocation(line: 96, column: 13, scope: !154)
!161 = !DILocation(line: 96, column: 28, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !19, line: 96, column: 27)
!163 = !DILocation(line: 97, column: 9, scope: !154)
!164 = !DILocation(line: 97, column: 15, scope: !154)
!165 = !DILocation(line: 97, column: 22, scope: !154)
!166 = !DILocation(line: 98, column: 9, scope: !154)
!167 = !DILocation(line: 98, column: 15, scope: !154)
!168 = !DILocation(line: 98, column: 22, scope: !154)
!169 = !DILocation(line: 99, column: 5, scope: !154)
!170 = !DILocation(line: 100, column: 12, scope: !147)
!171 = !DILocation(line: 100, column: 5, scope: !147)
