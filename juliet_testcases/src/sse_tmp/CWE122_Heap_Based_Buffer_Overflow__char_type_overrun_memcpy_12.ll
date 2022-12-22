; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12_bad() #0 !dbg !25 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !51
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
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !61
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !61
  call void @free(i8* %11) #6, !dbg !62
  br label %if.end22, !dbg !63

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid8, metadata !64, metadata !DIExpression()), !dbg !67
  %call9 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !68
  %12 = bitcast i8* %call9 to %struct._charVoid*, !dbg !69
  store %struct._charVoid* %12, %struct._charVoid** %structCharVoid8, align 8, !dbg !67
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !70
  %cmp10 = icmp eq %struct._charVoid* %13, null, !dbg !72
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !73

if.then11:                                        ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !74
  unreachable, !dbg !74

if.end12:                                         ; preds = %if.else
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !76
  %voidSecond13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %14, i32 0, i32 1, !dbg !77
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond13, align 8, !dbg !78
  %15 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !79
  %voidSecond14 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %15, i32 0, i32 1, !dbg !80
  %16 = load i8*, i8** %voidSecond14, align 8, !dbg !80
  call void @printLine(i8* %16), !dbg !81
  %17 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !82
  %charFirst15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %17, i32 0, i32 0, !dbg !83
  %arraydecay16 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst15, i64 0, i64 0, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay16, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !84
  %18 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !85
  %charFirst17 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %18, i32 0, i32 0, !dbg !86
  %arrayidx18 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst17, i64 0, i64 15, !dbg !85
  store i8 0, i8* %arrayidx18, align 1, !dbg !87
  %19 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !88
  %charFirst19 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %19, i32 0, i32 0, !dbg !89
  %arraydecay20 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst19, i64 0, i64 0, !dbg !88
  call void @printLine(i8* %arraydecay20), !dbg !90
  %20 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !91
  %voidSecond21 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %20, i32 0, i32 1, !dbg !92
  %21 = load i8*, i8** %voidSecond21, align 8, !dbg !92
  call void @printLine(i8* %21), !dbg !93
  %22 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !94
  %23 = bitcast %struct._charVoid* %22 to i8*, !dbg !94
  call void @free(i8* %23) #6, !dbg !95
  br label %if.end22

if.end22:                                         ; preds = %if.end12, %if.end
  ret void, !dbg !96
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12_good() #0 !dbg !97 {
entry:
  call void @good1(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* null) #6, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 %conv) #6, !dbg !111
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12_good(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12_bad(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !119 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %structCharVoid8 = alloca %struct._charVoid*, align 8
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !120
  %tobool = icmp ne i32 %call, 0, !dbg !120
  br i1 %tobool, label %if.then, label %if.else, !dbg !122

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !123, metadata !DIExpression()), !dbg !126
  %call1 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !127
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !128
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !126
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !129
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !131
  br i1 %cmp, label %if.then2, label %if.end, !dbg !132

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !135
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !136
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !137
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !138
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !139
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !139
  call void @printLine(i8* %4), !dbg !140
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !141
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !142
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !143
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !144
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !145
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !144
  store i8 0, i8* %arrayidx, align 1, !dbg !146
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !147
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !148
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !147
  call void @printLine(i8* %arraydecay6), !dbg !149
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !150
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !151
  %9 = load i8*, i8** %voidSecond7, align 8, !dbg !151
  call void @printLine(i8* %9), !dbg !152
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !153
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !153
  call void @free(i8* %11) #6, !dbg !154
  br label %if.end22, !dbg !155

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid8, metadata !156, metadata !DIExpression()), !dbg !159
  %call9 = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !160
  %12 = bitcast i8* %call9 to %struct._charVoid*, !dbg !161
  store %struct._charVoid* %12, %struct._charVoid** %structCharVoid8, align 8, !dbg !159
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !162
  %cmp10 = icmp eq %struct._charVoid* %13, null, !dbg !164
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !165

if.then11:                                        ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !166
  unreachable, !dbg !166

if.end12:                                         ; preds = %if.else
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !168
  %voidSecond13 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %14, i32 0, i32 1, !dbg !169
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond13, align 8, !dbg !170
  %15 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !171
  %voidSecond14 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %15, i32 0, i32 1, !dbg !172
  %16 = load i8*, i8** %voidSecond14, align 8, !dbg !172
  call void @printLine(i8* %16), !dbg !173
  %17 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !174
  %charFirst15 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %17, i32 0, i32 0, !dbg !175
  %arraydecay16 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst15, i64 0, i64 0, !dbg !176
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay16, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !176
  %18 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !177
  %charFirst17 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %18, i32 0, i32 0, !dbg !178
  %arrayidx18 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst17, i64 0, i64 15, !dbg !177
  store i8 0, i8* %arrayidx18, align 1, !dbg !179
  %19 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !180
  %charFirst19 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %19, i32 0, i32 0, !dbg !181
  %arraydecay20 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst19, i64 0, i64 0, !dbg !180
  call void @printLine(i8* %arraydecay20), !dbg !182
  %20 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !183
  %voidSecond21 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %20, i32 0, i32 1, !dbg !184
  %21 = load i8*, i8** %voidSecond21, align 8, !dbg !184
  call void @printLine(i8* %21), !dbg !185
  %22 = load %struct._charVoid*, %struct._charVoid** %structCharVoid8, align 8, !dbg !186
  %23 = bitcast %struct._charVoid* %22 to i8*, !dbg !186
  call void @free(i8* %23) #6, !dbg !187
  br label %if.end22

if.end22:                                         ; preds = %if.end12, %if.end
  ret void, !dbg !188
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12.c", directory: "/root/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!49 = !DILocation(line: 44, column: 20, scope: !32)
!50 = !DILocation(line: 44, column: 36, scope: !32)
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
!61 = !DILocation(line: 48, column: 18, scope: !32)
!62 = !DILocation(line: 48, column: 13, scope: !32)
!63 = !DILocation(line: 50, column: 5, scope: !33)
!64 = !DILocalVariable(name: "structCharVoid", scope: !65, file: !6, line: 54, type: !4)
!65 = distinct !DILexicalBlock(scope: !66, file: !6, line: 53, column: 9)
!66 = distinct !DILexicalBlock(scope: !29, file: !6, line: 52, column: 5)
!67 = !DILocation(line: 54, column: 24, scope: !65)
!68 = !DILocation(line: 54, column: 53, scope: !65)
!69 = !DILocation(line: 54, column: 41, scope: !65)
!70 = !DILocation(line: 55, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !6, line: 55, column: 17)
!72 = !DILocation(line: 55, column: 32, scope: !71)
!73 = !DILocation(line: 55, column: 17, scope: !65)
!74 = !DILocation(line: 55, column: 42, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !6, line: 55, column: 41)
!76 = !DILocation(line: 56, column: 13, scope: !65)
!77 = !DILocation(line: 56, column: 29, scope: !65)
!78 = !DILocation(line: 56, column: 40, scope: !65)
!79 = !DILocation(line: 58, column: 31, scope: !65)
!80 = !DILocation(line: 58, column: 47, scope: !65)
!81 = !DILocation(line: 58, column: 13, scope: !65)
!82 = !DILocation(line: 60, column: 20, scope: !65)
!83 = !DILocation(line: 60, column: 36, scope: !65)
!84 = !DILocation(line: 60, column: 13, scope: !65)
!85 = !DILocation(line: 61, column: 13, scope: !65)
!86 = !DILocation(line: 61, column: 29, scope: !65)
!87 = !DILocation(line: 61, column: 91, scope: !65)
!88 = !DILocation(line: 62, column: 31, scope: !65)
!89 = !DILocation(line: 62, column: 47, scope: !65)
!90 = !DILocation(line: 62, column: 13, scope: !65)
!91 = !DILocation(line: 63, column: 31, scope: !65)
!92 = !DILocation(line: 63, column: 47, scope: !65)
!93 = !DILocation(line: 63, column: 13, scope: !65)
!94 = !DILocation(line: 64, column: 18, scope: !65)
!95 = !DILocation(line: 64, column: 13, scope: !65)
!96 = !DILocation(line: 67, column: 1, scope: !25)
!97 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_12_good", scope: !6, file: !6, line: 110, type: !26, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 112, column: 5, scope: !97)
!99 = !DILocation(line: 113, column: 1, scope: !97)
!100 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 124, type: !101, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !103, !104}
!103 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !6, line: 124, type: !103)
!106 = !DILocation(line: 124, column: 14, scope: !100)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !6, line: 124, type: !104)
!108 = !DILocation(line: 124, column: 27, scope: !100)
!109 = !DILocation(line: 127, column: 22, scope: !100)
!110 = !DILocation(line: 127, column: 12, scope: !100)
!111 = !DILocation(line: 127, column: 5, scope: !100)
!112 = !DILocation(line: 129, column: 5, scope: !100)
!113 = !DILocation(line: 130, column: 5, scope: !100)
!114 = !DILocation(line: 131, column: 5, scope: !100)
!115 = !DILocation(line: 134, column: 5, scope: !100)
!116 = !DILocation(line: 135, column: 5, scope: !100)
!117 = !DILocation(line: 136, column: 5, scope: !100)
!118 = !DILocation(line: 138, column: 5, scope: !100)
!119 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 74, type: !26, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocation(line: 76, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !119, file: !6, line: 76, column: 8)
!122 = !DILocation(line: 76, column: 8, scope: !119)
!123 = !DILocalVariable(name: "structCharVoid", scope: !124, file: !6, line: 79, type: !4)
!124 = distinct !DILexicalBlock(scope: !125, file: !6, line: 78, column: 9)
!125 = distinct !DILexicalBlock(scope: !121, file: !6, line: 77, column: 5)
!126 = !DILocation(line: 79, column: 24, scope: !124)
!127 = !DILocation(line: 79, column: 53, scope: !124)
!128 = !DILocation(line: 79, column: 41, scope: !124)
!129 = !DILocation(line: 80, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !6, line: 80, column: 17)
!131 = !DILocation(line: 80, column: 32, scope: !130)
!132 = !DILocation(line: 80, column: 17, scope: !124)
!133 = !DILocation(line: 80, column: 42, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !6, line: 80, column: 41)
!135 = !DILocation(line: 81, column: 13, scope: !124)
!136 = !DILocation(line: 81, column: 29, scope: !124)
!137 = !DILocation(line: 81, column: 40, scope: !124)
!138 = !DILocation(line: 83, column: 31, scope: !124)
!139 = !DILocation(line: 83, column: 47, scope: !124)
!140 = !DILocation(line: 83, column: 13, scope: !124)
!141 = !DILocation(line: 85, column: 20, scope: !124)
!142 = !DILocation(line: 85, column: 36, scope: !124)
!143 = !DILocation(line: 85, column: 13, scope: !124)
!144 = !DILocation(line: 86, column: 13, scope: !124)
!145 = !DILocation(line: 86, column: 29, scope: !124)
!146 = !DILocation(line: 86, column: 91, scope: !124)
!147 = !DILocation(line: 87, column: 31, scope: !124)
!148 = !DILocation(line: 87, column: 47, scope: !124)
!149 = !DILocation(line: 87, column: 13, scope: !124)
!150 = !DILocation(line: 88, column: 31, scope: !124)
!151 = !DILocation(line: 88, column: 47, scope: !124)
!152 = !DILocation(line: 88, column: 13, scope: !124)
!153 = !DILocation(line: 89, column: 18, scope: !124)
!154 = !DILocation(line: 89, column: 13, scope: !124)
!155 = !DILocation(line: 91, column: 5, scope: !125)
!156 = !DILocalVariable(name: "structCharVoid", scope: !157, file: !6, line: 95, type: !4)
!157 = distinct !DILexicalBlock(scope: !158, file: !6, line: 94, column: 9)
!158 = distinct !DILexicalBlock(scope: !121, file: !6, line: 93, column: 5)
!159 = !DILocation(line: 95, column: 24, scope: !157)
!160 = !DILocation(line: 95, column: 53, scope: !157)
!161 = !DILocation(line: 95, column: 41, scope: !157)
!162 = !DILocation(line: 96, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !157, file: !6, line: 96, column: 17)
!164 = !DILocation(line: 96, column: 32, scope: !163)
!165 = !DILocation(line: 96, column: 17, scope: !157)
!166 = !DILocation(line: 96, column: 42, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !6, line: 96, column: 41)
!168 = !DILocation(line: 97, column: 13, scope: !157)
!169 = !DILocation(line: 97, column: 29, scope: !157)
!170 = !DILocation(line: 97, column: 40, scope: !157)
!171 = !DILocation(line: 99, column: 31, scope: !157)
!172 = !DILocation(line: 99, column: 47, scope: !157)
!173 = !DILocation(line: 99, column: 13, scope: !157)
!174 = !DILocation(line: 101, column: 20, scope: !157)
!175 = !DILocation(line: 101, column: 36, scope: !157)
!176 = !DILocation(line: 101, column: 13, scope: !157)
!177 = !DILocation(line: 102, column: 13, scope: !157)
!178 = !DILocation(line: 102, column: 29, scope: !157)
!179 = !DILocation(line: 102, column: 91, scope: !157)
!180 = !DILocation(line: 103, column: 31, scope: !157)
!181 = !DILocation(line: 103, column: 47, scope: !157)
!182 = !DILocation(line: 103, column: 13, scope: !157)
!183 = !DILocation(line: 104, column: 31, scope: !157)
!184 = !DILocation(line: 104, column: 47, scope: !157)
!185 = !DILocation(line: 104, column: 13, scope: !157)
!186 = !DILocation(line: 105, column: 18, scope: !157)
!187 = !DILocation(line: 105, column: 13, scope: !157)
!188 = !DILocation(line: 108, column: 1, scope: !119)
