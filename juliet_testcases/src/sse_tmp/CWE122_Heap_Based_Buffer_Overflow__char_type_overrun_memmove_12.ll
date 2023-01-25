; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %structCharVoid8 = alloca %struct._charVoid*, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !31, metadata !DIExpression()), !dbg !34
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !35
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !36
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !34
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !37
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !39
  br i1 %cmp, label %if.then2, label %if.end, !dbg !40

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !43
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !44
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !45
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !46
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !47
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !47
  call void @printLine(i8* %4), !dbg !48
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !49
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !50
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !51
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !53
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !55
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !56
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay6), !dbg !57
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !58
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !59
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !59
  call void @printLine(i8* %9), !dbg !60
  br label %if.end22, !dbg !61

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid8, metadata !62, metadata !DIExpression()), !dbg !65
  %call9 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !66
  %10 = bitcast i8* %call9 to %struct._charVoid*, !dbg !67
  store %struct._charVoid* %10, %struct._charVoid** %structCharVoid8, align 8, !dbg !65
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !68
  %cmp10 = icmp eq %struct._charVoid* %11, null, !dbg !70
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !71

if.then11:                                        ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !72
  unreachable, !dbg !72

if.end12:                                         ; preds = %if.else
  %12 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !74
  %voidSecond13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %12, i32 0, i32 1, !dbg !75
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond13, align 8, !dbg !76
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !77
  %voidSecond14 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %13, i32 0, i32 1, !dbg !78
  %14 = load i8*, i8** %voidSecond14, align 8, !dbg !78
  call void @printLine(i8* %14), !dbg !79
  %15 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !80
  %charFirst15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %15, i32 0, i32 0, !dbg !81
  %arraydecay16 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst15, i64 0, i64 0, !dbg !82
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay16, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !82
  %16 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !83
  %charFirst17 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %16, i32 0, i32 0, !dbg !84
  %arrayidx18 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst17, i64 0, i64 15, !dbg !83
  store i8 0, i8* %arrayidx18, align 1, !dbg !85
  %17 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !86
  %charFirst19 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %17, i32 0, i32 0, !dbg !87
  %arraydecay20 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst19, i64 0, i64 0, !dbg !86
  call void @printLine(i8* %arraydecay20), !dbg !88
  %18 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !89
  %voidSecond21 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %18, i32 0, i32 1, !dbg !90
  %19 = load i8*, i8** %voidSecond21, align 8, !dbg !90
  call void @printLine(i8* %19), !dbg !91
  br label %if.end22

if.end22:                                         ; preds = %if.end12, %if.end
  ret void, !dbg !92
}

declare dso_local i32 @globalReturnsTrueOrFalse(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printLine(i8*) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12_good() #0 !dbg !93 {
entry:
  call void @good1(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !96 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !115 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %structCharVoid8 = alloca %struct._charVoid*, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !119, metadata !DIExpression()), !dbg !122
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !123
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !124
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !122
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !125
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !127
  br i1 %cmp, label %if.then2, label %if.end, !dbg !128

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !131
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !132
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !133
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !134
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !135
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !135
  call void @printLine(i8* %4), !dbg !136
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !137
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !138
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !139
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !139
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !140
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !141
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !140
  store i8 0, i8* %arrayidx, align 1, !dbg !142
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !143
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !144
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !143
  call void @printLine(i8* %arraydecay6), !dbg !145
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !146
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !147
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !147
  call void @printLine(i8* %9), !dbg !148
  br label %if.end22, !dbg !149

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid8, metadata !150, metadata !DIExpression()), !dbg !153
  %call9 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !154
  %10 = bitcast i8* %call9 to %struct._charVoid*, !dbg !155
  store %struct._charVoid* %10, %struct._charVoid** %structCharVoid8, align 8, !dbg !153
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !156
  %cmp10 = icmp eq %struct._charVoid* %11, null, !dbg !158
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !159

if.then11:                                        ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !160
  unreachable, !dbg !160

if.end12:                                         ; preds = %if.else
  %12 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !162
  %voidSecond13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %12, i32 0, i32 1, !dbg !163
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond13, align 8, !dbg !164
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !165
  %voidSecond14 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %13, i32 0, i32 1, !dbg !166
  %14 = load i8*, i8** %voidSecond14, align 8, !dbg !166
  call void @printLine(i8* %14), !dbg !167
  %15 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !168
  %charFirst15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %15, i32 0, i32 0, !dbg !169
  %arraydecay16 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst15, i64 0, i64 0, !dbg !170
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay16, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !170
  %16 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !171
  %charFirst17 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %16, i32 0, i32 0, !dbg !172
  %arrayidx18 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst17, i64 0, i64 15, !dbg !171
  store i8 0, i8* %arrayidx18, align 1, !dbg !173
  %17 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !174
  %charFirst19 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %17, i32 0, i32 0, !dbg !175
  %arraydecay20 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst19, i64 0, i64 0, !dbg !174
  call void @printLine(i8* %arraydecay20), !dbg !176
  %18 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !177
  %voidSecond21 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %18, i32 0, i32 1, !dbg !178
  %19 = load i8*, i8** %voidSecond21, align 8, !dbg !178
  call void @printLine(i8* %19), !dbg !179
  br label %if.end22

if.end22:                                         ; preds = %if.end12, %if.end
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 256, elements: !8)
!8 = !{!9, !14, !16}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 128)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, elements: !12)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 16)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !7, file: !6, line: 27, baseType: !15, size: 64, offset: 128)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !7, file: !6, line: 28, baseType: !15, size: 64, offset: 192)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocation(line: 35, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !6, line: 35, column: 8)
!30 = !DILocation(line: 35, column: 8, scope: !25)
!31 = !DILocalVariable(name: "structCharVoid", scope: !32, file: !6, line: 38, type: !4)
!32 = distinct !DILexicalBlock(scope: !33, file: !6, line: 37, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !6, line: 36, column: 5)
!34 = !DILocation(line: 38, column: 24, scope: !32)
!35 = !DILocation(line: 38, column: 53, scope: !32)
!36 = !DILocation(line: 38, column: 41, scope: !32)
!37 = !DILocation(line: 39, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !6, line: 39, column: 17)
!39 = !DILocation(line: 39, column: 32, scope: !38)
!40 = !DILocation(line: 39, column: 17, scope: !32)
!41 = !DILocation(line: 39, column: 42, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !6, line: 39, column: 41)
!43 = !DILocation(line: 40, column: 13, scope: !32)
!44 = !DILocation(line: 40, column: 29, scope: !32)
!45 = !DILocation(line: 40, column: 40, scope: !32)
!46 = !DILocation(line: 42, column: 31, scope: !32)
!47 = !DILocation(line: 42, column: 47, scope: !32)
!48 = !DILocation(line: 42, column: 13, scope: !32)
!49 = !DILocation(line: 44, column: 21, scope: !32)
!50 = !DILocation(line: 44, column: 37, scope: !32)
!51 = !DILocation(line: 44, column: 13, scope: !32)
!52 = !DILocation(line: 45, column: 13, scope: !32)
!53 = !DILocation(line: 45, column: 29, scope: !32)
!54 = !DILocation(line: 45, column: 91, scope: !32)
!55 = !DILocation(line: 46, column: 31, scope: !32)
!56 = !DILocation(line: 46, column: 47, scope: !32)
!57 = !DILocation(line: 46, column: 13, scope: !32)
!58 = !DILocation(line: 47, column: 31, scope: !32)
!59 = !DILocation(line: 47, column: 47, scope: !32)
!60 = !DILocation(line: 47, column: 13, scope: !32)
!61 = !DILocation(line: 49, column: 5, scope: !33)
!62 = !DILocalVariable(name: "structCharVoid", scope: !63, file: !6, line: 53, type: !4)
!63 = distinct !DILexicalBlock(scope: !64, file: !6, line: 52, column: 9)
!64 = distinct !DILexicalBlock(scope: !29, file: !6, line: 51, column: 5)
!65 = !DILocation(line: 53, column: 24, scope: !63)
!66 = !DILocation(line: 53, column: 53, scope: !63)
!67 = !DILocation(line: 53, column: 41, scope: !63)
!68 = !DILocation(line: 54, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !6, line: 54, column: 17)
!70 = !DILocation(line: 54, column: 32, scope: !69)
!71 = !DILocation(line: 54, column: 17, scope: !63)
!72 = !DILocation(line: 54, column: 42, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !6, line: 54, column: 41)
!74 = !DILocation(line: 55, column: 13, scope: !63)
!75 = !DILocation(line: 55, column: 29, scope: !63)
!76 = !DILocation(line: 55, column: 40, scope: !63)
!77 = !DILocation(line: 57, column: 31, scope: !63)
!78 = !DILocation(line: 57, column: 47, scope: !63)
!79 = !DILocation(line: 57, column: 13, scope: !63)
!80 = !DILocation(line: 59, column: 21, scope: !63)
!81 = !DILocation(line: 59, column: 37, scope: !63)
!82 = !DILocation(line: 59, column: 13, scope: !63)
!83 = !DILocation(line: 60, column: 13, scope: !63)
!84 = !DILocation(line: 60, column: 29, scope: !63)
!85 = !DILocation(line: 60, column: 91, scope: !63)
!86 = !DILocation(line: 61, column: 31, scope: !63)
!87 = !DILocation(line: 61, column: 47, scope: !63)
!88 = !DILocation(line: 61, column: 13, scope: !63)
!89 = !DILocation(line: 62, column: 31, scope: !63)
!90 = !DILocation(line: 62, column: 47, scope: !63)
!91 = !DILocation(line: 62, column: 13, scope: !63)
!92 = !DILocation(line: 65, column: 1, scope: !25)
!93 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_12_good", scope: !6, file: !6, line: 106, type: !26, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocation(line: 108, column: 5, scope: !93)
!95 = !DILocation(line: 109, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 120, type: !97, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!99, !99, !100}
!99 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !6, line: 120, type: !99)
!102 = !DILocation(line: 120, column: 14, scope: !96)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !6, line: 120, type: !100)
!104 = !DILocation(line: 120, column: 27, scope: !96)
!105 = !DILocation(line: 123, column: 22, scope: !96)
!106 = !DILocation(line: 123, column: 12, scope: !96)
!107 = !DILocation(line: 123, column: 5, scope: !96)
!108 = !DILocation(line: 125, column: 5, scope: !96)
!109 = !DILocation(line: 126, column: 5, scope: !96)
!110 = !DILocation(line: 127, column: 5, scope: !96)
!111 = !DILocation(line: 130, column: 5, scope: !96)
!112 = !DILocation(line: 131, column: 5, scope: !96)
!113 = !DILocation(line: 132, column: 5, scope: !96)
!114 = !DILocation(line: 134, column: 5, scope: !96)
!115 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 72, type: !26, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 74, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !115, file: !6, line: 74, column: 8)
!118 = !DILocation(line: 74, column: 8, scope: !115)
!119 = !DILocalVariable(name: "structCharVoid", scope: !120, file: !6, line: 77, type: !4)
!120 = distinct !DILexicalBlock(scope: !121, file: !6, line: 76, column: 9)
!121 = distinct !DILexicalBlock(scope: !117, file: !6, line: 75, column: 5)
!122 = !DILocation(line: 77, column: 24, scope: !120)
!123 = !DILocation(line: 77, column: 53, scope: !120)
!124 = !DILocation(line: 77, column: 41, scope: !120)
!125 = !DILocation(line: 78, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !6, line: 78, column: 17)
!127 = !DILocation(line: 78, column: 32, scope: !126)
!128 = !DILocation(line: 78, column: 17, scope: !120)
!129 = !DILocation(line: 78, column: 42, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !6, line: 78, column: 41)
!131 = !DILocation(line: 79, column: 13, scope: !120)
!132 = !DILocation(line: 79, column: 29, scope: !120)
!133 = !DILocation(line: 79, column: 40, scope: !120)
!134 = !DILocation(line: 81, column: 31, scope: !120)
!135 = !DILocation(line: 81, column: 47, scope: !120)
!136 = !DILocation(line: 81, column: 13, scope: !120)
!137 = !DILocation(line: 83, column: 21, scope: !120)
!138 = !DILocation(line: 83, column: 37, scope: !120)
!139 = !DILocation(line: 83, column: 13, scope: !120)
!140 = !DILocation(line: 84, column: 13, scope: !120)
!141 = !DILocation(line: 84, column: 29, scope: !120)
!142 = !DILocation(line: 84, column: 91, scope: !120)
!143 = !DILocation(line: 85, column: 31, scope: !120)
!144 = !DILocation(line: 85, column: 47, scope: !120)
!145 = !DILocation(line: 85, column: 13, scope: !120)
!146 = !DILocation(line: 86, column: 31, scope: !120)
!147 = !DILocation(line: 86, column: 47, scope: !120)
!148 = !DILocation(line: 86, column: 13, scope: !120)
!149 = !DILocation(line: 88, column: 5, scope: !121)
!150 = !DILocalVariable(name: "structCharVoid", scope: !151, file: !6, line: 92, type: !4)
!151 = distinct !DILexicalBlock(scope: !152, file: !6, line: 91, column: 9)
!152 = distinct !DILexicalBlock(scope: !117, file: !6, line: 90, column: 5)
!153 = !DILocation(line: 92, column: 24, scope: !151)
!154 = !DILocation(line: 92, column: 53, scope: !151)
!155 = !DILocation(line: 92, column: 41, scope: !151)
!156 = !DILocation(line: 93, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !151, file: !6, line: 93, column: 17)
!158 = !DILocation(line: 93, column: 32, scope: !157)
!159 = !DILocation(line: 93, column: 17, scope: !151)
!160 = !DILocation(line: 93, column: 42, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !6, line: 93, column: 41)
!162 = !DILocation(line: 94, column: 13, scope: !151)
!163 = !DILocation(line: 94, column: 29, scope: !151)
!164 = !DILocation(line: 94, column: 40, scope: !151)
!165 = !DILocation(line: 96, column: 31, scope: !151)
!166 = !DILocation(line: 96, column: 47, scope: !151)
!167 = !DILocation(line: 96, column: 13, scope: !151)
!168 = !DILocation(line: 98, column: 21, scope: !151)
!169 = !DILocation(line: 98, column: 37, scope: !151)
!170 = !DILocation(line: 98, column: 13, scope: !151)
!171 = !DILocation(line: 99, column: 13, scope: !151)
!172 = !DILocation(line: 99, column: 29, scope: !151)
!173 = !DILocation(line: 99, column: 91, scope: !151)
!174 = !DILocation(line: 100, column: 31, scope: !151)
!175 = !DILocation(line: 100, column: 47, scope: !151)
!176 = !DILocation(line: 100, column: 13, scope: !151)
!177 = !DILocation(line: 101, column: 31, scope: !151)
!178 = !DILocation(line: 101, column: 47, scope: !151)
!179 = !DILocation(line: 101, column: 13, scope: !151)
!180 = !DILocation(line: 104, column: 1, scope: !115)
